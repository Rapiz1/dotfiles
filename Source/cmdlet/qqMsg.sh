#!/bin/bash
inotifywait -mq -e access /home/rapiz/Source/cmdlet/qqMsg.wav | while read event
do
notify-send 'QQ' '新消息' -a qqMsg
done
