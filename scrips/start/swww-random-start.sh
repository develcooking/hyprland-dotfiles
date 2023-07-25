#!/bin/bash

DIR=~/.config/backgrounds/
PICS=($(ls ${DIR}))

sleep 2
RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-fps 60 --transition-type any --transition-duration 3
