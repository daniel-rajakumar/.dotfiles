#!/bin/bash

kill -s USR1 $(pidof deadd-notification-center)  
sleep 0.1
sh $HOME/scripts/lockScreen.sh


