 #!/bin/sh


apps=(
        "Outlook \0icon\x1fms-outlook"
        "Office \0icon\x1fms-office"
        "Unreal Engine 4 \0icon\x1fepic-games"
        "Youtube Music \0icon\x1fyoutube-music-desktop-app"
)

for app in "${apps[@]}"; do
    list+="$app\n"
done

if [ -z "$@" ]; then
   app="$(echo -en $list | rofi -dmenu -icon-theme "Papirus" -show-icons -p "websites")"
else
   app="$@"
fi

        if [[ "$app" == *"Outlook"* ]]; then
                brave --kiosk --new-window "https://outlook.com" &
                sleep 1.5
                bspc node focused -t tiled
                bspc node -d 10

        elif [[ "$app" == *"Office"* ]]; then
                brave --kiosk --new-window "https://office.com" &
                sleep 1.5
                bspc node focused -t tiled
                bspc node -d 19

        elif [[ "$app" == *"Unreal Engine 4"* ]]; then
		./UnrealEngine/Engine/Binaries/Linux/UE4Editor

        elif [[ "$app" == *"Youtube Music"* ]]; then
                brave --kiosk --new-window "https://music.youtube.com" &
                sleep 1.5
                bspc node focused -t tiled
                bspc node -d 0
        fi

