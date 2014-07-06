
#!/bin/bash

OLDIFS=$IFS
IFS=''
ARGS=0
if [ $# -ne $ARGS ];then
        echo "Error: Invalid Number of Arguments!"
        exit 1
fi
back=1
logfile="AccessLog"

sudo find /etc/ -daystart -atime $back -type f -printf "%p\t%Ab %Ad %AH:%AM\n" > $logfile
	
IFS=$OLDIFS
