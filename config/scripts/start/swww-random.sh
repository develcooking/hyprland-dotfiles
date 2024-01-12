#!/bin/bash

DIR=~/.config/backgrounds/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3


notify-send -i ${DIR}/${RANDOMPICS} "Wallpaper Changed" ${RANDOMPICS}
