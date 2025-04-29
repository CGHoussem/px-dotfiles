#!/bin/bash

DEVICE="6C:93:08:66:D7:32"
MAX_ATTEMPTS=5
SLEEEP_INTERVAL=3

attempt=1
sleep 5 # initial wait to let bluetooth stack come online

while [[ $attempt -le $MAX_ATTEMPTS ]]; do
    echo "Attempt $attempt to connect to $DEVICE..."
    bluetoothctl connect "$DEVICE" >/dev/null

    # check if connected
    if bluetoothctl info "$DEVICE" | grep -q "Connected: yes"; then
        notify-send "Bluetooth Keyboard" "Connected on attempt $attempt"
        echo "Connected to $DEVICE"
        exit 0
    fi

    sleep "$SLEEP_INTERVAL"
    ((attempt++))
done

notify-send "Bluetooth Keyboard" "Failed to connect after $MAX_ATTEMPTS attempts"
echo "Failed to connect to $DEVICE after $MAX_ATTEMPTS attempts."
exit 1
