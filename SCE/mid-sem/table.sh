#!/bin/bash

table(){

	for i in `seq 1 1 $2`
	do
		echo `expr $1 \* $i`
	done

}

table $1 $2
