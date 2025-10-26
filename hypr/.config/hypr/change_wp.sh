#!/bin/bash

sleep 2

directory="$HOME/Pictures/Wallpapers/"
monitors=$(hyprctl monitors | grep Monitor | awk '{print $2}')

if [ -d "$directory" ]; then
    hyprctl hyprpaper unload all
    for monitor in $monitors; do
        random_background=$(ls $directory/*.png | shuf -n 1)

        hyprctl hyprpaper preload $random_background
        hyprctl hyprpaper wallpaper "$monitor, $random_background"
    done
fi
