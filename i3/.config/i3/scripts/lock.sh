#!/bin/bash

# Lock screen with blur and a beautiful color scheme

# Set background
img="/tmp/i3lock.png"
scrot "$img"                    # takes a screenshot
convert "$img" -blur 0x8 "$img" # applies blur

# Set colors
inside=#282c34ff
ring=#61afefaa
text=#ffffffcc
wrong=#e06c75ff
verifying=#98c379ff

i3lock \
    --image="$img" \
    --inside-color=373445ff \
    --ring-color=ffffffff \
    --line-color=00000000 \
    --separator-color=222222ff \
    --verif-color=ffffffff \
    --wrong-color=ff5555ff \
    --time-color=ffffffff \
    --date-color=ffffffff \
    --layout-color=ffffffff \
    --keyhl-color=81a2beff \
    --bshl-color=ff5555ff \
    --ringver-color=81a2beff \
    --ringwrong-color=ff5555ff \
    --indicator \
    --radius=120 \
    --ring-width=10 \
    --time-str="%H:%M" \
    --date-str="%A, %d %B" \
    --clock \
    --blur 5 \
    --force-clock

rm "$img"
