#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

ID=$(polybar-msg cmd list | sed 's/[^0-9]*//g' |  sed -n '2 p')

TOGGLE=$HOME/.toggle/togglePolybar_bottom

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
       polybar-msg -p $ID cmd hide
       bspc config -m focused bottom_padding 0
else
    rm $TOGGLE
       polybar-msg -p $ID cmd show 
       bspc config -m focused bottom_padding 30
fi



exit 0
