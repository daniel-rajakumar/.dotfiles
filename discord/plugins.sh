#!/bin/bash

# conform
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

#plugins
plugins=(
    https://raw.githubusercontent.com/CapnKitten/BetterDiscord/master/Plugins/HideChannels/HideChannels.plugin.js
    https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/LastMessageDate/LastMessageDate.plugin.js
    https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/ServerDetails/ServerDetails.plugin.js


    # https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/BetterSearchPage/BetterSearchPage.plugin.js
    # https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/CreationDate/CreationDate.plugin.js
    # https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/EmojiStatistics/EmojiStatistics.plugin.js
    # https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/ForceImagePreviews/ForceImagePreviews.plugin.js
    # https://raw.githubusercontent.com/mwittrien/BetterDiscordAddons/master/Plugins/CompleteTimestamps/CompleteTimestamps.plugin.js
)


for i in "${plugins[@]}"
do
    wget $i -P ~/.config/BetterDiscord/plugins/
done