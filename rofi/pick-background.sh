#!/bin/env bash

wallpaper_folder=$HOME/.config/backgrounds/
wallpaper_location="$(ls "$wallpaper_folder" | sort | rofi -dmenu -i -p "Select Background" -theme "$HOME/.config/rofi/pick-background.rasi" -hover-select -me-select-entry '' -me-accept-entry MousePrimary)"


if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
    wallpaper_temp="$wallpaper_location"
elif [[ -f $wallpaper_folder/$wallpaper_location ]]; then
	swww img "$wallpaper_folder"/"$wallpaper_temp"/"$wallpaper_location" --transition-fps 60 --transition-type any --transition-duration 3
else
    exit 1
fi

#https://github.com/asifakonjee/Hyprland/blob/3b148eae43b2a542c1d8f3a2459d023f0e2b6177/config/rofi/bin/powermenu
