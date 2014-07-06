# FILE-NAME : 5.sh
# ROLL NO : 201305543
# NAME : RISHI MITTAL
# Q5. Write a recursive script that recursively lists all files i.e is
#     equivalent to 'ls -R'. Arguments will work like those provided to
#     the ls command. (Hint: Use export and readlink to store absolute
#     path of the script)


#!/bin/bash

oldIFS=$IFS
IFS=''
exf=`readlink -f $0`
rt=$1
if [ $# -eq 0 ]; then
	bash $exf "."
fi
argno=$#

while (( $argno )) ;do
	flag=0
	rt=$1
	if [ ! -e $rt ];then
        	echo "Error: Invalid File/Directory!"	
		flag=1
	elif [ ! -d $rt ];then
		echo $rt
	else
	m=`readlink -f $rt`
	echo $m:
	cd $rt
	for f in *
	do
		if [ ! -d $f ]
		then
			echo $f
		else
			n=`readlink -f $f`
			bash $exf $n
		fi
	
	done
	if [ $flag -eq 0 ];then 
		cd ..
	fi
	fi	
	shift
	argno=`expr $argno - 1`	
done

IFS=oldIFS
