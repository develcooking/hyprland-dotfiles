#!/bin/bash
swww init
DIR=~/.config/backgrounds/
PICS=($(ls ${DIR}))

sleep 6
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3
