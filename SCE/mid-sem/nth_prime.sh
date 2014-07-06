#!/bin/bash

isPrime(){
	flag=0
	range=`expr $1 - 1`
	
	for i in `seq 2 1 $range`
	do
		if [ `expr $1 % $i` -eq 0 ]
		then
			flag=1
		fi 
	done

	if [ $flag -eq 1 ]
	then
		return "NOT PRIME"
	else
		return "PRIME"
	fi
}

read n
i=0;
count=0;
while [ 1 ]
do 
	if [ isPrime 1 == "PRIME" ]
	then
		count++; 
done
