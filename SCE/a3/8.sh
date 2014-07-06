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
	
ftrash=~/TRASH
if [ ! -e $ftrash ] && [ ! -d $ftrash ];then
	sudo mkdir $ftrash
fi

for i in $@
do
	if [ ! -e $i ];then
		echo "Error: Invalid File/Directory!"
	fi
done
