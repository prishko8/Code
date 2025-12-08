#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -o /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Outputs/
#$ -e /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Errors/

# Ensure we're using bash
export SHELL=/bin/bash

cd /gpfs0/smoshe/users/prishkro/Projects/LossTan
output_file="/gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Results/results.csv"

tmpdir="/gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Results/tmp"
outputs_dir="/gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Outputs"
errors_dir="/gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Errors"

# Clean up previous run - remove old temp files, results, and log files
echo "Cleaning up from previous runs..."
rm -rf "${tmpdir}"
rm -f "${output_file}"
rm -f "${outputs_dir}"/*
rm -f "${errors_dir}"/*

# Create fresh directories and initialize results file
mkdir -p "${tmpdir}"
mkdir -p "${outputs_dir}"
mkdir -p "${errors_dir}"
echo "v,sol,xi" > "${output_file}"

# Generate 100 linearly spaced intervals from 3.63e-10 to 7.26e-6, each with 10 sample points
# Intervals will have 10% overlap to ensure smooth transitions
v_min=3.63e-10
v_max=7.26e-6
overlap_percentage=0.10  # 10% overlap
job_ids=()

for i in $(seq 0 99); do
    # Calculate base interval boundaries with linear spacing
    base_v_start=$(python3 -c "import math; v_min=$v_min; v_max=$v_max; i=$i; print(f'{v_min * ((v_max / v_min) ** (i / 99)):.15e}')")
    base_v_end=$(python3 -c "import math; v_min=$v_min; v_max=$v_max; i=$i; print(f'{v_min * ((v_max / v_min) ** ((i + 1) / 99)):.15e}')")
    
    # Calculate interval width and overlap amount
    interval_width=$(python3 -c "base_start=$base_v_start; base_end=$base_v_end; print(f'{base_end - base_start:.15e}')")
    overlap_amount=$(python3 -c "width=$interval_width; overlap=$overlap_percentage; print(f'{width * overlap:.15e}')")
    
    # Adjust interval boundaries to add overlap
    if [ $i -eq 0 ]; then
        # First interval: no overlap at start, overlap at end
        v_start=$base_v_start
        v_end=$(python3 -c "base_end=$base_v_end; overlap=$overlap_amount; print(f'{base_end + overlap:.15e}')")
    elif [ $i -eq 99 ]; then
        # Last interval: overlap at start, no overlap at end
        v_start=$(python3 -c "base_start=$base_v_start; overlap=$overlap_amount; print(f'{base_start - overlap:.15e}')")
        v_end=$base_v_end
    else
        # Middle intervals: overlap on both sides
        v_start=$(python3 -c "base_start=$base_v_start; overlap=$overlap_amount; print(f'{base_start - overlap:.15e}')")
        v_end=$(python3 -c "base_end=$base_v_end; overlap=$overlap_amount; print(f'{base_end + overlap:.15e}')")
    fi
    
    jobname="fir_int_$i"
    jobscript="$tmpdir/job_$i.sh"
    cat <<EOF > "$jobscript"
#!/bin/bash
cd /gpfs0/smoshe/users/prishkro/Projects/LossTan
python3 /gpfs0/smoshe/users/prishkro/Projects/LossTan/LossTan_Interval.py "$v_start" "$v_end" 10 > "$tmpdir/result_$i.csv"
EOF
    
    job_id=$(qsub -S /bin/bash -q smoshe.q -N "$jobname" -o /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Outputs/ -e /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Errors/ "$jobscript" | cut -d' ' -f3)
    job_ids+=($job_id)
    sleep 5
done

# Create job dependency list
dependency_list=$(IFS=:; echo "${job_ids[*]}")

# Create collection job that waits for all interval jobs to complete
collection_script="$tmpdir/collect_results.sh"
cat <<EOF > "$collection_script"
#!/bin/bash
cd /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Results

# Wait a bit to ensure all jobs have finished writing their files
sleep 60

# Count and list all result files
echo "Checking for result files..."
found_files=0
missing_files=()

for i in \$(seq 0 99); do
    if [ -f "tmp/result_\$i.csv" ]; then
        ((found_files++))
    else
        missing_files+=(\$i)
        echo "WARNING: Missing result_\$i.csv"
    fi
done

echo "Found \$found_files out of 100 expected result files"
if [ \${#missing_files[@]} -gt 0 ]; then
    echo "Missing files: \${missing_files[*]}"
fi

# Combine all available results into the main CSV file
echo "Combining result files..."
files_processed=0
for i in \$(seq 0 99); do
    if [ -f "tmp/result_\$i.csv" ] && [ -s "tmp/result_\$i.csv" ]; then
        cat "tmp/result_\$i.csv" >> results.csv
        ((files_processed++))
    fi
done

echo "Processed \$files_processed result files"

# Sort the results by v value (excluding header) and remove duplicates
echo "Sorting results..."
if [ -f "results.csv" ] && [ -s "results.csv" ]; then
    (head -n 1 results.csv && tail -n +2 results.csv | sort -t',' -k1,1g | sort -t',' -k1,1g -u) > results_sorted.csv
    mv results_sorted.csv results.csv
    
    # Count final lines in results
    total_lines=\$(wc -l < results.csv)
    data_lines=\$((total_lines - 1))
    echo "Final results.csv contains \$data_lines data rows (plus 1 header)"
else
    echo "ERROR: No results.csv file created or file is empty"
fi

echo "Results collection completed. Final file: results.csv"
EOF

# Submit collection job with dependency on all interval jobs
qsub -S /bin/bash -q smoshe.q -N "fir_collect" -hold_jid "$dependency_list" -o /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Outputs/ -e /gpfs0/smoshe/users/prishkro/Projects/LossTan/fir_Loop/Errors/ "$collection_script"