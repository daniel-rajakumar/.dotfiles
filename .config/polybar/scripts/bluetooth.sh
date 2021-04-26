
#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

NAME=$(bluetoothctl -- info | grep "Name:" | cut -d ':' -f2)

if [ -z "$NAME" ]; then
    echo 
else
    if [ ! -e $HOME/.toggle/toggle_bluetooth_polybar ]; then
        echo %{F#56B6C2} 
    else
        echo %{F#56B6C2}  %{F-}$NAME
    fi
fi

echo $NAME

exit 0
