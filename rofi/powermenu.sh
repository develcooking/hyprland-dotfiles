#!/bin/bash
 
lock=" Lock"
logout="󰍃 Logout"
poweroff="⏻ Poweroff"
reboot=" Reboot"
sleep=" Suspend"
 
selected_option=$(echo "$poweroff
$lock
$reboot
$sleep
$logout" | rofi -dmenu -i -p "Powermenu" \
		  -theme "~/.config/rofi/powermenu.rasi")

if [ "$selected_option" == "$lock" ]
then
  swaylock
elif [ "$selected_option" == "$logout" ]
then
  systemctl terminate-user `jp`
elif [ "$selected_option" == "$poweroff" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
else
  echo "No match"
fi