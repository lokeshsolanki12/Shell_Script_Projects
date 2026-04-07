#!/bin/bash
 

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')



TH=100

if [[ $FREE_SPACE -lt $TH ]]
then 
	echo "Warning, RAM is runnig low"
else 
	echo "RAM Space is sufficient - $FREE_SPACE M"
fi











