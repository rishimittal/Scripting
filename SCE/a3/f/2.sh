
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
for file in * 
do
	if [ "$file" == "$FILE_B" ] 
	then
		rm $file
	fi
done
while read line
do
	echo $line >> $FILE_B

done <$FILE_A

IFS=$OLDIFS
