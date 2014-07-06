# FILE-NAME : 9b.sh
# ROLL NO : 201305543
# NAME : RISHI MITTAL

#!/bin/bash
ARGS=2
OLDIFS=$IFS
IFS=''

if [ $# -ne $ARGS ];then
	echo "Error: Invalid Number of Arguments!"
	exit 1
fi

strcmp(){
	s=$1
	t=$2
	ns=`printf "%d" "'${s[0]:0:1}"`
	ts=`printf "%d" "'${t[0]:0:1}"`
	i=1
	while [ $i -ge 1 ];do
		if [ $ns -ne $ts ] || [ $ns == 0 ];then
			break
		fi	
		ns=`printf "%d" "'${s[0]:$i:1}"`
		ts=`printf "%d" "'${t[0]:$i:1}"`
		#echo $ns $ts
		i=`expr $i + 1`
	done 			
 	diff=`expr $ns - $ts`	
	echo $diff
}
strlen(){
	rt=$1
	echo ${#rt}
}

strcat(){
	echo "$1""$2" 
}

strstr(){
	line=`echo $1 | grep -b -o $2 | head -1`
	echo $line
	if [ -z $line ];then
		echo "-1"
	else
		IFS=":"
		echo $line
	fi
}

#strtok(){}



strcmp $1 $2
strlen $1
strlen $2
strcat $1 $2
strstr $1 $2

IFS=$OLDIFS
