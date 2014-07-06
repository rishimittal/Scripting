

#!/bin/bash

oldIFS=$IFS
IFS=''
exf=`readlink -f $0`
rt=$1

if [ $# -eq 0 ]; then
	bash $exf "."
	exit 1
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
	elif [ -d $rt ];then
		m=`readlink -f $rt`
		echo $m:
		
		if [ ! -x $rt ];then
			shift
			argno=`expr $argno - 1`
			continue
		fi
		cd $rt
		for f in *
		do
			if [ $f != '*' ] &&  [ ! -d $f ]
			then
				echo $f
			elif [ -d $f ];then
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
