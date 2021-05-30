#!/bin/bash

kill -s USR1 $(pidof deadd-notification-center)

TOGGLE=$HOME/.toggle/toggle_bluetoothToggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    bluetoothctl power on
    notify-desktop "Bluetooth : on" 
else
    rm $TOGGLE
    bluetoothctl power off
    notify-desktop "Bluetooth : off" 
fi
