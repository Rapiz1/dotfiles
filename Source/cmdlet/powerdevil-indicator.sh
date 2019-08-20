#!/bin/bash
pid=`pidof org_kde_powerdevil`
if [ $? -eq 0 ]
then
   echo  
else
   echo %{F#555}%{F-}
fi
