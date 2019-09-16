#!/bin/sh

player_status=$(playerctl status -i chrome,chroimum 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "ﱘ $(playerctl metadata title -i chrome,chromium 2>/dev/null)"
elif [ "$player_status" = "Paused" ]; then
    echo " $(playerctl metadata title -i chrome,chromium 2>/dev/null)"
else
    echo ""
fi
