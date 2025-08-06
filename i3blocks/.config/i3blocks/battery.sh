#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]+?%')
CHARGING_STATUS=$(acpi -b | grep -E -o 'Discharging|Charging')

echo "Battery: $BAT"
echo "BAT: $BAT"

[ "$CHARGING_STATUS" = "Charging" ] && echo "#00CCFF" && exit 0

[ ${BAT%?} -le 10 ] && exit 33
[ ${BAT%?} -le 40 ] && echo "#FF8000"

exit 0
