#!/bin/bash

INTERNAL="eDP1"
EXTERNAL="HDMI-0"

if xrandr | grep "$EXTERNAL connected"; then
    xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto
else
    xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
fi
