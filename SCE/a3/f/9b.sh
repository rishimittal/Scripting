
#!/bin/bash

OLDIFS=$IFS
IFS=''

. ./9a.sh

ARGS=2
if [ $# -ne $ARGS ];then
        echo "Error: Invalid Number of Arguments!"
        exit 1
fi

strcmp $1 $2
strlen $1
strlen $2
strcat $1 $2
strtok $1 $2
strstr $1 $2

IFS=$OLDIFS

