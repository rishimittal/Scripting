#!/bin/bash

read -p "Enter the number :" num
sum=0
sn=$num
while [ $sn -gt 0 ]
do
	dig=`expr $sn % 10`
	sum=`expr $sum + $dig`
	sn=`expr $sn \/ 10`
done

echo "Sum : " $sum
