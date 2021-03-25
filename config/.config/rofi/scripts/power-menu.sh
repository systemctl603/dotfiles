#!/bin/bash


lock=" Lock"
logout=" Logout"
poweroff=" Power"
reboot=" Reboot"

options="$lock\n$logout\n$poweroff\n$reboot"
echo $options

selected=$(echo -e $options | rofi -theme "~/.config/rofi/scripts/theme/power-menu.rasi" -dmenu -i)

case $selected in
  $lock)
    playerctl --all-players pause
    light-locker-command -l
    ;;
  $logout)
    awesome-client "awesome.quit()"
    ;;
  $poweroff)
    systemctl poweroff
    ;;
  $reboot)
    systemctl reboot
    ;;
esac
