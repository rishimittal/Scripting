#!/bin/bash

read -p "Enter first date in mm/dd/yyyy " date1
read -p "Enter Second date in mm/dd/yyyy " date2

d1=`date -d  $date1 +%s`
d2=`date -d  $date2 +%s`

d3=`expr $d2 - $d1`

#echo $d1
#echo $d2
echo $d3/84600 | bc

#echo $d3
#echo $d4
