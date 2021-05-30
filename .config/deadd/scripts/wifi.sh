#!/bin/sh

kill -s USR1 $(pidof deadd-notification-center)

wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"

if [ "$wifi" == "enabled" ];then
    nmcli r wifi off 
    notify-desktop "Wifi : off" 
else
    nmcli r wifi on
    notify-desktop "Wifi : on" 
fi
