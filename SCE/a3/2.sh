# FILE-NAME : 2.sh
# ROLL NO : 201305503
# NAME : RISHI MITTAL
# Q2.  Write a bash script that backs itself up, that is, copies itself to a
#      file named backup.sh.


#!/bin/bash

ARGS=0;
OLDIFS=$IFS
IFS=''
FILE_B="backup.sh"
FILE_A="$0"

if [ $# -ne $ARGS ]
then
	echo "Error: Invalid Number of Arguments!"
        exit 1
fi
#Removes backup.sh if present
for file in * 
do
	if [ "$file" == "$FILE_B" ] 
	then
		rm $file
	fi
done
#Reads file line by line and appends to backup.sh
while read line
do
	echo $line >> $FILE_B

done <$FILE_A

IFS=$OLDIFS
