#!/bin/bash

# Lock screen with blur and a beautiful color scheme

# Set background
img="$HOME/Pictures/retro_wp.jpg"
# ALTERNATIVE: use a blurred screenshot of the current screen as background
# img="/tmp/screen.png"
#scrot "$img"
#magick convert "$img" -blur 0x8 "$img" # applies blur

text=#ffffffcc
i3lock \
    --beep \
    --tiling \
    --image="$img" \
    --clock \
    --time-pos="ix:200" \
    --date-pos="tx:225" \
    --time-color="$text" \
    --date-color="$text"

# rm "$img"
