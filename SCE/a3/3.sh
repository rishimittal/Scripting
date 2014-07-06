# FILE-NAME : 3.sh
# ROLL NO : 201305503
# NAME : RISHI MITTAL
# Q3. 3. Write a script to lowercase all file/directory names in a
#	 directory. Input will be a single directory. If a lowercase
# 	 file/directory of the same name already exists in that directory,
#	 the program should warn the user and NOT overwrite the
#	 existing file/directory.

#!/bin/bash

ARGS=1
#Check for the Number of Arg to be 1.
if [ $# -ne $ARGS ]
then
	echo "Error: Invalid Number of Arguments!"
        exit 1
fi

#Check for the argument to be a directory name.
if [ ! -d $1 ]
then
	echo "Error: Input not a directory"
	exit 1 
fi

cd $1
for str in *
do	
	st=`echo $str | tr '[:upper:]' '[:lower:]'`
	flag=1
	if [ "$str" == "$st" ]
	then
		#echo $str
		continue
	else
		for fn in *
		do
			if [ "$st" == "$fn" ]
			then
				echo "Warning: Not overwriting $st"
				flag=0
			fi
		done

		if [ $flag == 1 ]
		then
			mv "$str" "$st"
		fi
	fi

done
