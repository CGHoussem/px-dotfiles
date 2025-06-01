#!/bin/bash

IFACE=$(ip route | awk '/^default/ {print $5}' | head -n1)

if [ -z "$IFACE" ]; then
    echo "Disconnected"
    exit 33
fi

STATUS=$(cat /sys/class/net/$IFACE/operstate)

if [ "$STATUS" = "up" ]; then
    echo "Connected"
    IP=$(ip -4 addr show "$IFACE" | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
    echo "Connected: $IP"
    exit 0
else
    echo "Disconnected"
    exit 33
fi
