# FILE-NAME : 4.sh
# ROLL NO : 201305503
# NAME : RISHI MITTAL
# Q4. Solve a quadratic equation of the form Ax^2 + Bx + C = 0. Have a
#     script take as arguments the coefficients, A, B, and C, and return
#     the solutions to five decimal places.

#!/bin/bash
ARGS=3
#Check for the Number of Arg to be 1.
if [ $# -ne $ARGS ]
then
        echo "Error: Invalid Number of Arguments!"
        exit 1
fi
arg1=`echo $1 | grep -E "^[-]?[0-9]+$|^[-]?[0-9]+[.][0-9]+$"`
arg2=`echo $2 | grep -E "^[-]?[0-9]+$|^[-]?[0-9]+[.][0-9]+$"`
arg3=`echo $3 | grep -E "^[-]?[0-9]+$|^[-]?[0-9]+[.][0-9]+$"`

if [ -z $arg1 ] || [ -z $arg2 ] || [ -z $arg3 ]
then	
        echo "Error: Input not a number"
        exit 1
fi

d=`echo "scale=5; $arg2 * $arg2 - 4 * $arg1 * $arg3" | bc -l`
res=`echo "$d < 0" | bc `
#echo $d
#echo $res

if [ $res -eq 1 ]
then
	echo "No Solutions were found"
	exit 1
fi

sqd=`echo "scale=5; sqrt ( $d )" | bc -l`
r1n=`echo "scale=5; -1 * $arg2 + $sqd" | bc -l`
r2n=`echo "scale=5; -1 * $arg2 - $sqd" | bc -l`
de=`echo "scale=5; 2 * $arg1" | bc -l`
r1=`echo "scale=5; $r1n / $de" | bc -l`
r2=`echo "scale=5; $r2n / $de" | bc -l`

echo $r1,$r2




