# FILE-NAME : 1.sh
# ROLL NO : 201305503
# NAME : RISHI MITTAL
# Q1. Write a bash script that echoes itself to stdout, but backwards.

#!/bin/bash

ARGS=0;
OLDIFS=$IFS
IFS=''

#if [ $# -ne "$ARGS" ]  #Check for the arguments to be Zero.
#then
#	echo "Error: Invalid Number of Arguments!"
#	exit 1	
#fi

file="$1"

declare -a  my_array
i=0
while read -r line
do
        #echo $line
        my_array[$i]=$line
        i=`expr $i + 1`
done <"$file"

array_len=`expr ${#my_array[@]} - 1`

for ((i=$array_len; i >= 0 ; i--))
do
	var=${my_array[$i]}
	echo $var | awk '{ for(i=length;i!=0;i--) x=x substr($0 , i ,1); }END { print x} '
done

IFS=OLDIFS
