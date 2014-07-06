
#!/bin/bash
ARGS=1
OLDIFS=$IFS
IFS=''
exp=`readlink -f $0`
count=0
str="|   "
recur_func(){
	if [ ! -x $1 ];then
		#echo "|-- "$1
		return
	fi
	cd $1
	for i in * 
	do	
		if [ $i != '*' ] && [ ! -d $i ];then
			#echo $count
			for (( l = 0 ; l < $count ; l++));do
				echo -n "$str"
			done
			echo "|-- "$i
		elif [ -d $i ];then
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
