#!/bin/bash

CPU_TEMP=$(sensors | awk '/^Package id 0:/ {gsub("\\+|°C","",$4); print int($4)}')

echo "CPU: $CPU_TEMP°C"

[ ${CPU_TEMP} -lt 60 ] && exit 0  # green ouput
[ ${CPU_TEMP} -lt 80 ] && exit 33 # yellow output

exit 66 # red output
