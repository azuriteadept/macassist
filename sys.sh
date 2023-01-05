#!/bin/zsh
# System information puller for MacAssist 3.

# 1. Pull system info.
sys_serial_raw=$(system_profiler SPHardwareDataType | grep "Serial Number")
sys_model_raw=$(system_profiler SPHardwareDataType | grep "Model Identifier")
sys_cpu_raw=$(sysctl machdep.cpu.brand_string)
sys_gpu_raw=$(system_profiler SPDisplaysDataType | grep "Chipset Model")

# 2. Run string processing on system info.
sys_serial=$sys_serial_raw[(ws{: })-1]
sys_model=$sys_model_raw[(ws{: })-1]
sys_cpu=$sys_cpu_raw[(ws{: })-1]
sys_gpu=$sys_gpu_raw[(ws{: })-1]

# 3. Echo output.
echo $sys_serial
echo $sys_model
echo $sys_cpu
echo $sys_gpu