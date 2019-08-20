#!/bin/bash
pid=`pidof org_kde_powerdevil`
if [ $? -eq 1 ]
then
    notify-send Powerdevil On -t 2000
    /usr/lib/org_kde_powerdevil & disown /usr/lib/org_kde_powerdevil
else
    notify-send Powerdevil Off -t 2000
    kill $pid
fi
