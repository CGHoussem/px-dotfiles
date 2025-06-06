#!/bin/bash

GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)

echo "GPU: $GPU_TEMP°C"

[ ${GPU_TEMP} -lt 60 ] && exit 0  # green ouput
[ ${GPU_TEMP} -lt 80 ] && exit 33 # yellow output

exit 66 # red output
