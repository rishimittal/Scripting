# FILE-NAME : 6.sh
# ROLL NO : 201305543
# NAME : RISHI MITTAL
# Q6. Write a script that produces a visualization tree of a directory.
#     You must take only 1 argument as input and it must be a
#     directory.

#!/bin/bash
ARGS=1
OLDIFS=$IFS
IFS=''
exp=`readlink -f $0`
count=0
str="|   "
recur_func(){
	cd $1
	for i in * 
	do	
		if [ ! -d $i ];then
			#echo $count
			for (( l = 0 ; l < $count ; l++));do
				echo -n "$str"
			done
			echo "|-- "$i
		else
			#echo $count
			for (( l = 0 ; l < $count ; l++));do
				echo -n "$str"
			done
			echo "|-- "$i
			count=`expr $count + 1`
			recur_func $i
			cd ..
			count=`expr $count - 1`
		fi	
	done
}

if [ $# -ne $ARGS ];then
	echo "Error: Invalid Number of Arguments!"
	exit 1
fi
if [ ! -d  $1 ];then
	echo "Error: Input not a directory"
	exit 1
fi

echo $1
recur_func $1


IFS=$OLDIFS
