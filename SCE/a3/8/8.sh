# FILE-NAME : 8.sh
# ROLL NO : 201305503
# NAME : RISHI MITTAL
# Q8. Implement, as a script, a "safe" delete command, 8.sh. Filenames
#     passed as command-line arguments to this script are not deleted,
#     but instead gzipped if not already compressed (use file to check),
#     then moved to a ~/TRASH directory. Upon invocation, the script
#     checks the ~/TRASH directory for files older than 48 hours and
#     permanently deletes them.

#!/bin/bash
che="gzip"
ftrash=~/TRASH
if [ ! -e $ftrash ] && [ ! -d $ftrash ];then
	sudo mkdir $ftrash
fi

for i in $@
do
	if [ ! -e $i ];then
		echo "Error: Invalid File!"
	else
		var=`file -b -e compress $i | cut -c 1-4`
		if [ $var == $che ];then
			sudo mv $i $ftrash 
		else
			sudo gzip $i
			fm=`echo $i".gz"`
			sudo mv $fm $ftrash
		fi
	fi
done

m=`sudo find $ftrash -mtime 2 -type f`
for i in $m
do	
	sudo rm $i
done

