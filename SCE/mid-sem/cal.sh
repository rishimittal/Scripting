#!/bin/bash

echo "(a) Add"
echo "(b) Substract"
echo "(c) Multiply"
echo "(d) Divide"
echo "(e) Modulus"
echo "(f) Exponention"

read -p "Operation :" op
read -p "Enter 1st Number :" a1
read -p "Enter 2nd Number :" a2

case $op in
a)
	echo `expr $a1 + $a2`
;;
b)
	echo `expr $a1 - $a2`
;;
c)
	echo `expr $a1 \* $a2`
;;
d)
	echo `expr $a1 \/ $a2`
;;
e)
	echo `expr $a1 % $a2`
;;
f)
	echo "$a1 ^ $a2" | bc
;;
*)
	echo "Invalid Input"
;;
esac











