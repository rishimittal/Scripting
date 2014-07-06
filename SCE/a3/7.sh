# FILE-NAME : 7.sh
# ROLL NO : 201305543
# NAME : RISHI MITTAL
# Q7. Assume that you are an administrator of a lab machine. The
#     labs are open on all days except Sunday.
#     Write a shell script that logs all accesses to the files in /etc
#     during the course of a single day (Take it to be the previous day
#     and NOT 24 hrs from now).
#     This information should include the filename and access time.
#     Write this data as tabular (tab-separated) formatted records in a
#     logfile called "AccessLog".
#     (Hint: Use sudo to get over 'permission denied' messages)


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

sudo find /etc/ -daystart -atime $back -iname "*" -printf "%p\t%Ab %Ad %AH:%AM\n" > $logfile
	
IFS=$OLDIFS
