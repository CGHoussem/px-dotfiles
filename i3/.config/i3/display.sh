#!/bin/bash

INTERNAL="DP-2"
EXTERNAL="HDMI-0"

if xrandr | grep "$EXTERNAL connected"; then
    #xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto
    xrandr -d :0 --output $INTERNAL --auto
    xrandr --output "$EXTERNAL" --auto --primary
    xrandr --output "$INTERNAL" --right-of "$EXTERNAL"
else
    xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
fi

xrandr --output DP-2 --primary
