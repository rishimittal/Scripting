
#!/bin/bash

ARGS=0;
OLDIFS=$IFS
IFS=''
if [ $# -ne "$ARGS" ]  #Check for the arguments to be Zero.
then
	echo "Error: Invalid Number of Arguments!"
	exit 1	
fi

file="$0"

while read -r line
do
	echo $line | awk '{ for(i=length;i!=0;i--) x=x substr($0 , i ,1); }END { print x}'
done <"$file"

IFS=OLDIFS
