#!/bin/zsh
# RAM info gatherer for MacAssist 3.

# 1. Get RAM capacity data.
ram_size_raw=$(system_profiler SPMemoryDataType | grep "Size:")
ram_size=(${(f)ram_size_raw})
for item in $ram_size; do
    # a. Get each bank's capacity and expressed unit.
    # item_key_raw=$item[(ws{: })1]
    # item_key=$item_key_raw[(ws{ })-1]
    item_val=$item[(ws{: })-1]
    item_val_num=$item_val[(ws{ })1]
    item_val_unit=$item_val[(ws{ })-1]

    # b. Do a sanity check.
    echo "Val:($item_val_num) Unit:($item_val_unit)"

    # c. Handle different units (unimplemented).

    # d. Add this bank's capacity to total capacity (unimplemented).

done
    # e. Return total capacity as number (unimplemented).

# 2. Get RAM type data.
    # a. Check if RAM types are all the same.
    # b. If not, send an Info and all banks' RAM types.
    # c. Strip RAM type down to first word. (DDR4 vs. DDR4 SO-DIMM)
    # d. Return first bank's RAM type as string.

# 3. Get RAM speed data.
    # a. Check if RAM types are all the same.
    # b. If not, send an Info and all bank's RAM speeds.
    # c. Return slowest bank's RAM speed as number.

# Final outputs:
    # (Capacity) 8
    # (Type) DDR4 SO-DIMM
    # (Speed) 2400
    # (Info) INFO: Non-uniform RAM types 
    # (Info) INFO: Non-uniform RAM speeds (2400 / 2666)