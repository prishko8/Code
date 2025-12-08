#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -t 1-1000
#$ -o /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Outputs/
#$ -e /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Errors/

# Ensure we're using bash
export SHELL=/bin/bash

cd /gpfs0/smoshe/users/prishkro/Projects/LossTan

# Only the first job clears and creates directories to avoid race conditions
if [ "$SGE_TASK_ID" -eq 1 ]; then
    # Clear and create directories
    rm -rf /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Outputs/
    rm -rf /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Errors/
    rm -rf /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Results/
    
    mkdir -p /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Outputs/
    mkdir -p /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Errors/
    mkdir -p /gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Results/
    
    echo "Directories cleared and created by job 1"
    sleep 2  # Give other jobs time to start after directories are created
else
    # Wait for first job to create directories
    sleep 3
fi

# Define v range and calculate this job's v range
v_min=3.63e-10
v_max=7.26e-6
total_points=10000000
n_jobs=1000

# Calculate global job ID
global_job_id=$SGE_TASK_ID

# Calculate v range for this job
v_range=$(python3 -c "
import math
v_min = $v_min
v_max = $v_max
total_points = $total_points
n_jobs = $n_jobs
job_id = $global_job_id - 1  # Convert to 0-based indexing

# Calculate points per job (handle remainder for last job)
base_points_per_job = total_points // n_jobs
remainder = total_points % n_jobs

if job_id < remainder:
    points_per_job = base_points_per_job + 1
    start_idx = job_id * points_per_job
else:
    points_per_job = base_points_per_job
    start_idx = remainder * (base_points_per_job + 1) + (job_id - remainder) * base_points_per_job

end_idx = start_idx + points_per_job - 1

# Calculate corresponding v values using logarithmic spacing
v_start = v_min * ((v_max / v_min) ** (start_idx / (total_points - 1)))
v_end = v_min * ((v_max / v_min) ** (end_idx / (total_points - 1)))

print(f'{v_start:.15e} {v_end:.15e} {points_per_job}')
")

# Extract v_start, v_end, and points_per_job
v_start=$(echo $v_range | cut -d' ' -f1)
v_end=$(echo $v_range | cut -d' ' -f2)
points_per_job=$(echo $v_range | cut -d' ' -f3)

echo "Job $SGE_TASK_ID computing v range: $v_start to $v_end ($points_per_job points)"

# Run the interval calculation for this job's range
output_file="/gpfs0/smoshe/users/prishkro/Projects/LossTan/array_Loop/Results/interval_$global_job_id.csv"
python3 /gpfs0/smoshe/users/prishkro/Projects/LossTan/LossTan_Interval.py "$v_start" "$v_end" "$points_per_job" > "$output_file"

echo "Job $SGE_TASK_ID completed for v range: $v_start to $v_end"