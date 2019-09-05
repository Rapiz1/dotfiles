#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "ﱘ $(playerctl metadata title -i chrome,chromium)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata title -i chrome,chromium)"
else
    echo ""
fi
