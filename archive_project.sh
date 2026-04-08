#!/bin/bash
#$Revision:001$

# Variables
BASE=/home/lucky/Shell_Script_Projects
DAYS=5
DEPTH=1
RUN=0

# Check if directory exists
if [[ ! -d $BASE ]]
then
    echo "Directory does not exist: $BASE"
    exit 1
fi

# Create archive folder if not present
if [[ ! -d $BASE/archive ]]
then
    mkdir $BASE/archive
fi

# Find files >20MB and archive them
for i in $(find $BASE -maxdepth $DEPTH -type f -size +20M)
do
    if [ $RUN -eq 0 ]
    then
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
        gzip "$i" || exit 1
        mv "$i.gz" $BASE/archive || exit 1
    fi
done
