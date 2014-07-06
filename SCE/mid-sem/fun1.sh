#!/bin/bash

func1()
{
echo "Inside Func1"
}

i=1;
while [ $i -le 10 ]
do
	func1
	i=`expr $i + 1`
done

echo "Now Outside func1"
