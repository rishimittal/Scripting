
#!/bin/bash
OLDF=$IFS
IFS=""

ARGS=1
if [ $# -ne $ARGS ]
then
	echo "Error: Invalid Number of Arguments!"
        exit 1
fi

if [ ! -d $1 ]
then
	echo "Error: Input not a directory"
	exit 1 
fi

cd $1
for str in *
do	
	st=`echo $str | tr '[:upper:]' '[:lower:]'`
	flag=1
	if [ "$str" == "$st" ]
	then
		continue
	else
		for fn in *
		do
			if [ "$st" == "$fn" ]
			then
				echo "Warning: Not overwriting $st"
				flag=0
			fi
		done

		if [ $flag == 1 ]
		then
			mv "$str" "$st"
		fi
	fi

done
IFS=OLDF
