#!/bin/bash

DIR=~/.config/backgrounds/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type any --transition-duration 3


notify-send -i ${DIR}/${PICS} "Wallpaper Changed" ${PICS}
