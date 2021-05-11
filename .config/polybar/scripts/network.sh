#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

NAME=$(/usr/sbin/iwgetid -r)

if [ -z "$NAME" ]; then
    echo 
else
    if [ ! -e $HOME/.toggle/toggle_wifi_polybar ]; then
        echo %{F#61AFEF} 
    else
        echo %{F#61AFEF}   %{F-}$NAME
    fi
fi

exit 0
