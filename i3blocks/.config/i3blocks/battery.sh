#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')

echo "Battery: $BAT"
echo "BAT: $BAT"

# set urgent flag below 10% or use orange below 35%
[ ${BAT%?} -le 10 ] && exit 33
[ ${BAT%?} -le 35 ] && echo "#FF8000"

exit 0
