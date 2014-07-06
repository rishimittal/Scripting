
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
		echo "Error: Invalid File!"
	else
		var=`file -b $i | cut -c 1-4`
		if [ $var == $che ];then
			mv $i $ftrash 
		else
			gzip $i
			fm=`echo $i".gz"`
			mv $fm $ftrash			
		fi
	fi
done

m=`find $ftrash -mtime +2 -type f`
IFS=$OLDIFS
for i in $m
do	
	rm $i
done
IFS=$OLDIFS
