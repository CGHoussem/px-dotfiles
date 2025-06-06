#!/bin/bash

CPU_TEMP=$(sensors | awk '/^Package id 0:/ {gsub("\\+|°C","",$4); print int($4)}')

echo "CPU Temp: $CPU_TEMP°C"
echo "CPU: $CPU_TEMP°C"

[ ${CPU_TEMP} -ge 80 ] && exit 33
[ ${CPU_TEMP} -ge 60 ] && echo "#FF8000"

exit 0
