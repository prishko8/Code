#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -N STM_Loss_power_batch_Array

# --- Job Array Definition ---
# The number of tasks should divide the number of E_b values for the given power (e.g., 10 tasks)
# The task range is now set dynamically by the master submission script via `qsub -t ...`

# --- Power Index ---
# The POWER_INDEX and NUM_ROWS are provided by `qsub -v ...`

# --- Output and Error Directories ---
# The -o and -e paths are now provided by the qsub command in master_submission.sh

echo "Starting job $SGE_TASK_ID for POWER_INDEX=$POWER_INDEX on node: $(hostname)"

# --- Set up the Python Environment ---
# PYTHONUSERBASE forces python to look in your local directory for packages like numpy/scipy.
# PYTHONPATH is used to find your custom 'Base_Loss' module.
export PYTHONUSERBASE="/gpfs0/smoshe/users/prishkro/.local"
export PYTHONPATH="/gpfs0/smoshe/users/prishkro/Projects/LossTan:${PYTHONPATH}"

# --- Execute the Python Script ---
# Pass POWER_INDEX as a command-line argument to the python script.
python3 /gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/power_batch_set/STM_fit_power_batch.py "$POWER_INDEX"