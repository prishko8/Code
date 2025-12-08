#!/bin/bash

# Master submission script to run calculation jobs and then collect results

# --- Configuration ---
POWER_LEVELS=(1 2 3 4 5 6 7 8 9 10 11 12 13)  # Array of power levels
ROWS_TO_READ=(58 58 58 58 58 58 55 105 105 105 100 56 56) # Corresponds to POWER_LEVELS
BASE_DIR="/gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/power_batch_set"
RESULTS_DIR="${BASE_DIR}/Results"
TEMP_DATA_DIR="${BASE_DIR}/temp_data"
OUTPUT_FILE="/gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/merged_results.csv"

# --- Pre-computation Step: Extract data from Excel to temporary files ---
echo "Pre-computation: Extracting data from Excel to temporary files..."
mkdir -p "$TEMP_DATA_DIR"

# Set PYTHONUSERBASE to ensure the correct user-installed packages (like openpyxl) are found.
# Then, run the python one-liner using the standard python3 command.
PYTHONUSERBASE=/gpfs0/smoshe/users/prishkro/.local python3 -c "
import openpyxl, os
import sys
data_path = '/gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/Data/Figure2.xlsx'
columns_to_read = ['A:C', 'D:F', 'G:I', 'J:L', 'M:O', 'P:R', 'S:U', 'V:X', 'Y:AA', 'AB:AD', 'AE:AG', 'AH:AJ', 'AK:AM']
skip_rows = 1
rows_to_read = [58, 58, 58, 58, 58, 58, 55, 105, 105, 105, 100, 56, 56]
wb = openpyxl.load_workbook(data_path, data_only=True)
sheet = wb.active

def parse_col(col_str):
    col_num = 0
    for char in col_str: col_num = col_num * 26 + (ord(char.upper()) - ord('A') + 1)
    return col_num

for i, num_rows in enumerate(rows_to_read):
    power_index = i + 1
    temp_file_path = os.path.join('$TEMP_DATA_DIR', f'p{power_index}.txt')
    with open(temp_file_path, 'w') as f:
        start_col_str, _ = columns_to_read[i].split(':')
        e_b_col = parse_col(start_col_str)
        n_ph_col = e_b_col + 1
        losstan_col = e_b_col + 2
        for row_idx in range(skip_rows + 1, skip_rows + 1 + num_rows):
            e_b = sheet.cell(row=row_idx, column=e_b_col).value
            n_ph = sheet.cell(row=row_idx, column=n_ph_col).value
            loss_tan = sheet.cell(row=row_idx, column=losstan_col).value
            if e_b is not None and n_ph is not None and loss_tan is not None:
                f.write(f'{e_b},{n_ph},{loss_tan}\n')
"
echo "Data extraction complete."

# --- Submit Calculation Jobs ---
echo "Submitting calculation jobs..."

JOB_IDS=()  # Array to store job IDs

for i in "${!POWER_LEVELS[@]}"; do
  POWER_LEVEL=${POWER_LEVELS[$i]}
  # The number of tasks is now the number of lines in the temp file
  NUM_TASKS=$(wc -l < "${TEMP_DATA_DIR}/p${POWER_LEVEL}.txt")

  # Define the power-specific directories for logs here
  OUTPUT_LOG_DIR="${BASE_DIR}/Outputs/p${POWER_LEVEL}/"
  ERROR_LOG_DIR="${BASE_DIR}/Errors/p${POWER_LEVEL}/"
  mkdir -p "$OUTPUT_LOG_DIR"
  mkdir -p "$ERROR_LOG_DIR"

  echo "Submitting job for POWER_LEVEL=$POWER_LEVEL with $NUM_TASKS tasks."
  
  # Dynamically set the number of tasks with `-t` and pass both variables with `-v`
  # The `qsub` output is piped to `awk` to get the job ID string, then to `cut` to keep only the part before the '.'
  # This provides the correct format (e.g., '9180191') for the -hold_jid dependency.
  job_id=$(qsub -q smoshe.q -pe shared 8 -t 1-$NUM_TASKS -v POWER_INDEX=$POWER_LEVEL -o "$OUTPUT_LOG_DIR" -e "$ERROR_LOG_DIR" /gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/power_batch_set/STM_batch.sh | awk '{print $3}' | cut -d'.' -f1)
  
  echo "Submitted job ID: $job_id"
  JOB_IDS+=("$job_id")
done

# Convert the bash array of job IDs to a comma-separated string for -hold_jid
HOLD_LIST=$(IFS=,; echo "${JOB_IDS[*]}")

# --- Submit Collection Job ---
# Save the job IDs to a file for the collection script to check
JOB_ID_FILE="${TEMP_DATA_DIR}/job_ids.txt"
echo "${JOB_IDS[@]}" > "$JOB_ID_FILE"

echo "Submitting collection job, holding on job IDs: $HOLD_LIST"
COLLECT_OUTPUT_LOG_DIR="${BASE_DIR}/Outputs/"
COLLECT_ERROR_LOG_DIR="${BASE_DIR}/Errors/"
mkdir -p "$COLLECT_OUTPUT_LOG_DIR"
mkdir -p "$COLLECT_ERROR_LOG_DIR"

# Pass the path to the job ID file to the collection script
qsub -q smoshe.q -hold_jid "$HOLD_LIST" -N Result_Collector -v JOB_ID_FILE="$JOB_ID_FILE" -o "$COLLECT_OUTPUT_LOG_DIR" -e "$COLLECT_ERROR_LOG_DIR" /gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/power_batch_set/collect_results.sh

echo "Master submission script complete."