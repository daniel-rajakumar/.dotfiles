#!/bin/sh

TOGGLE=$HOME/.toggle/toggle_player

ERROR=$(playerctl -p playerctld metadata 2>&1 >/dev/null)

if [ $(playerctl -p playerctld status) == "Paused" ]; then
    echo 
elif [ $(playerctl -p playerctld status) == "Playing" ]; then
    echo 
else 
    echo "No player found"
fi
