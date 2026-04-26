#!/bin/bash

INTERNAL="eDP1"
EXTERNAL="HDMI-1-0"

if xrandr | grep "$EXTERNAL connected"; then
    #xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto
    xrandr -d :0 --output $INTERNAL --auto
    xrandr --output "$EXTERNAL" --auto --primary
    xrandr --output "$INTERNAL" --left-of "$EXTERNAL"
else
    xrandr --output "$EXTERNAL" --off --output "$INTERNAL" --auto
fi

xrandr --output "$INTERNAL" --primary
