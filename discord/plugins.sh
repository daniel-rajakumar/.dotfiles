#!/bin/bash

# conform
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

plugins=(
    https://raw.githubusercontent.com/CapnKitten/BetterDiscord/master/Plugins/HideChannels/HideChannels.plugin.js
)


for i in "${plugins[@]}"
do
    wget $i -P ~/.config/BetterDiscord/plugins/
done