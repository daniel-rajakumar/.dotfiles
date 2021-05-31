#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

ID1=$(polybar-msg cmd list | sed 's/[^0-9]*//g' |  sed -n '2 p')
ID2=$(polybar-msg cmd list | sed 's/[^0-9]*//g' |  sed -n '4 p')

TOGGLE=$HOME/.toggle/togglePolybar_bottom

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
       polybar-msg -p $ID1 cmd hide
       polybar-msg -p $ID2 cmd hide
       bspc config bottom_padding 0
else
    rm $TOGGLE
       polybar-msg -p $ID1 cmd show 
       polybar-msg -p $ID2 cmd show 
       bspc config bottom_padding 35
fi



exit 0
