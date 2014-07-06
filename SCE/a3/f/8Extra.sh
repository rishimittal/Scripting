#!/bin/bash

OLDIFS=$IFS
IFS=""
che="gzip"
ftrash=~/TRASH

if [ ! -e $ftrash ];then
        mkdir $ftrash
fi

for i in $@
do
        if [ ! -e $i ];then
                echo "Error: Invalid File/Directory!"
        elif [ ! -d $i ];then
                var=`file -b $i | cut -c 1-4`
                if [ $var == $che ];then
                        mv $i $ftrash
                else
                        gzip $i
                        fm=`echo $i".gz"`
                        mv $fm $ftrash
                fi
        elif [ -d $i ];then
		ziptar=`echo $i".tar.gz"`
		tar -czf $ziptar $i
		mv $ziptar $ftrash
		rm -rf $i		
	fi
done

m=`find $ftrash -mtime +2 -type f`
IFS=$OLDIFS

for ij in $m
do
	rm $ij
done

IFS=$OLDIFS

