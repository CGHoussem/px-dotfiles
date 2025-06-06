#!/bin/bash

GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)

echo "GPU Temp: $GPU_TEMP°C"
echo "GPU: $GPU_TEMP°C"

[ ${GPU_TEMP} -ge 80 ] && exit 33
[ ${GPU_TEMP} -ge 60 ] && echo "#FF8000"

exit 0
