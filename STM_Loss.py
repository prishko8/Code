import sys
import os

# --- Scheduler Affinity Setup ---

loss_path = os.path.abspath("/gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/loop_set")
import numpy as np
import Base_Loss as bl

# Fitted Parameters
p = 11 # Debye
k1 = 5.71e3  # kHZ

# Paths
base_path = "/gpfs0/smoshe/users/prishkro/Projects/Excess_Loss/STM_fit/loop_set/"
temp_data_dir = os.path.join(base_path, "Temp")

# --- HPC Task Logic ---
try:
    if len(sys.argv) < 3:
        print("Usage: python3 STM_Loss.py <POWER_INDEX> <TASK_ID>")
        sys.exit(1)

    power_index_str = sys.argv[1]
    task_id_str = sys.argv[2]

    power_index = int(power_index_str)
    task_id = int(task_id_str)
        
    if task_id == 0:
        print("Error: Task ID cannot be 0 (1-based index required).")
        sys.exit(1)

except (ValueError, IndexError) as e:
    print(f"Error parsing inputs or Task ID. Details: {e}")
    sys.exit(1)

# --- Main Processing ---
try:
    temp_data_file = os.path.join(temp_data_dir, f"P{power_index}.txt")

    with open(temp_data_file, 'r') as f:
        all_lines = f.readlines()

    # task_id is 1-based, so subtract 1 for list index
    if task_id > len(all_lines):
        raise ValueError(f"Task ID {task_id} exceeds number of lines ({len(all_lines)}) in {temp_data_file}")

    line = all_lines[task_id - 1].strip()
    E_b_str, n_ph_str, LossTan_str = line.split(',')
    E_b_value = float(E_b_str)
    n_ph_value = float(n_ph_str)
    LossTan_value = float(LossTan_str)

    # Calculation
    Rabi = 60.32124394 * p * np.sqrt(n_ph_value) 
    v = (1336000/21) * p * E_b_value 
    nn = 100 
    STM_Loss_computed = np.real(bl.LossTan(Rabi, k1, v, nn))

    # Output
    output_dir = sys.argv[3]
    output_file = os.path.join(output_dir, f"{task_id}.csv")

    import csv
    with open(output_file, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['E_b', 'n_ph', 'LossTan_experimental', 'STM_Loss_computed'])
        writer.writerow([E_b_value, n_ph_value, LossTan_value, STM_Loss_computed])

    print(f"Saved: {output_file}")

except Exception as e:
    # Print to stderr so it shows up in the .e error log file
    print(f"FATAL ERROR in task {task_id} for POWER {power_index_str}: {e}", file=sys.stderr)
    sys.exit(1)