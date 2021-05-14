#~/bin/bash
#this shell script is PUBLIC DOMAIN. You may do whatever you want with it.

ID=$(polybar-msg cmd list | sed 's/[^0-9]*//g' |  sed -n '1 p')

TOGGLE=$HOME/.toggle/togglePolybar_top

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
        polybar-msg -p $ID cmd hide
        bspc config -m focused top_padding 0
else
    rm $TOGGLE
        polybar-msg -p $ID cmd show
        bspc config -m focused top_padding 35
fi



exit 0
