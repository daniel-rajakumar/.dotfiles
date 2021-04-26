#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle/toggle_player

ERROR=$(playerctl -p playerctld metadata 2>&1 >/dev/null)


if [[ $ERROR == "No player could handle this command" ]]; then
    echo "No player found"

elif [ $(playerctl -p playerctld status) == "Paused" ]; then
    playerctl -p playerctld play
elif [ $(playerctl -p playerctld status) == "Playing" ]; then
    playerctl -p playerctld pause
fi
