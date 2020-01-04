#!/bin/sh
if pgrep inotifywait > /dev/null
then
	echo qqMsg.sh: Duplicated. Exiting.
	exit
fi
i=0
inotifywait -mq -e access /home/rapiz/Source/cmdlet/qqMsg.wav | while read event
do
i=$i+1
if [[ $i -eq 4 ]]
then
	notify-send 'QQ' '新消息' -a qqMsg
	i=0
fi
done
