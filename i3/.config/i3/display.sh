#!/bin/bash

INTERNAL="eDP1"
EXTERNAL="HDMI-0"

if xrandr | grep "$EXTERNAL connected"; then
    #xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto
    xrandr -d :0 --output eDP1 --auto
    xrandr --output "$INTERNAL" --auto --primary
    xrandr --output "$INTERNAL" --left-of "$EXTERNAL"
else
    xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
fi
