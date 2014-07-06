#!/bin/bash

i=0
until [ $i -ge 30 ]
do
echo $i
i=`expr $i + 1`
done
