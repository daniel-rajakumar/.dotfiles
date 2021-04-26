#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle/toggle_bluetooth_polybar

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
else
    rm $TOGGLE
fi
