#!/bin/zsh
# Battery health tester for MacAssist 3.

# 1. Sanity check for the presence of a battery.
bh_data=$(ioreg -rc AppleSmartBattery)
if [ "$bh_data" = "" ];
    then echo 'No battery found, exiting.'; return 1;
fi

# 2. Retrieve battery status.
#   a. Get raw data.
bh_current_raw=$(ioreg -rc AppleSmartBattery | grep "\"CurrentCapacity\" =")
bh_max_raw=$(ioreg -rc AppleSmartBattery | grep "\"MaxCapacity\" =")
bh_design_raw=$(ioreg -rc AppleSmartBattery | grep "\"DesignCapacity\" =")
bh_condition_raw=$(system_profiler SPPowerDataType | grep "Condition:")

#   b. Perform string operations on the battery data.
bh_current=$bh_current_raw[(ws{ = })-1]
bh_max=$bh_max_raw[(ws{ = })-1]
bh_design=$bh_design_raw[(ws{ = })-1]
bh_condition=$bh_condition_raw[(ws{: })-1]

#   c. Calculate battery charge and health. 
bh_charge=$((bh_current * 100.0 / bh_max))
bh_health=$((bh_max * 100.0 / bh_design))

# 3. Return results.
# echo $bh_current / $bh_max / $bh_design mAh
echo $bh_charge[0,5]
echo $bh_health[0,5]
echo $bh_condition
return 0