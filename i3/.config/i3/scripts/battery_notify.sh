#!/bin/bash

# Set threshold (in percent)
THRESHOLD=20

# Get battery percentage (assumes BAT0)
LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Get charging status
STATUS=$(acpi -b | grep -o "Charging\|Discharging")

# Check if battery is below threshold and discharging
if [[ "$LEVEL" -le "$THRESHOLD" && "$STATUS" == "Discharging" ]]; then
    notify-send -u critical "Battery Low" "Battery is at ${LEVEL}%!"
fi
