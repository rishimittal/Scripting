#!/bin/bash

global_var=1;

factorial()
{
	if [ $1 -lt 1 ]
	then
		return `expr $global_var \* 1`	
	else
		factorial `expr $1 - 1`
		global_var=`expr $global_var \* $1`
	fi
}

read n
factorial $n
echo "Factorial of $n is $global_var"
