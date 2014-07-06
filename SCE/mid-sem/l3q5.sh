#!/bin/bash

# factorial(iterative)
read n
num=$n
fact=1

while [ $n -ne 0 ]
do
	fact=`expr $fact \* $n`
	n=`expr $n - 1`
done

echo "Factorial of $num :$fact" 



