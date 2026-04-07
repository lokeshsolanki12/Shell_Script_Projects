#!/bin/bash
 
# Monitoring the free fs space disk
 

FU=$(df -H | egrep -v "Filesystem|tmpfs" | grep "xvda16" | awk '{print $5}' | tr -d %)
TO="lokesh.solanki7014@gmail.com"

if [[ $FU -ge 60 ]]
then 
	echo "Warning, disk space is low - $FU %" | mail -s "DISK SPACE ALERT !" $TO
else 
	echo "ALL Good - $FU %" | mail -s "GOOD FOR NOW " $TO 
fi


