
#!/bin/bash
OLDIFS=$IFS
IFS=''
ARGS=1
wstat=`echo "WEAK"`
sstat=`echo "STRONG"`
OP_FILE=`echo "PasswordTest"`
S_PATH=`echo "/usr/share/dict/words"`

if [ $# -ne $ARGS ];then
	echo "Error: Invalid Number of Arguments!"
	exit 1
fi
FILE_N=$1
if [ ! -e  $FILE_N ];then
	echo "Error: Invalid File!"
	exit 1
fi

if [ -e $OP_FILE ];then
	rm $OP_FILE
fi

stat=$sstat
while read line
do
	len=${#line}
	if [ $len -lt 8 ];then
		stat=$wstat
	elif [ $len -ge 8 ];then
		stat=$sstat
	fi
	
	chek=`echo $line | grep '[0-9]'`
	if [ -z $chek ];then
		stat=$wstat 
	elif [ ! -z $chek ];then
		stat=$sstat
	fi
			
	chek1=`echo $line | grep -E '[@#$%*+=-]'`
	if [ -z $chek1 ];then
                stat=$wstat
        elif [ ! -z $chek1 ];then
                stat=$sstat
        fi
	sflag=0
	wflag=0
	if [ $stat == $sstat ];then
		for ((j = 4 ; j <= $len ; j++));do
			l=`expr $len - $j + 1`
			for (( i = 0; i < $l ; i++));do
				fin=${line[0]:$i:$j}
				yes=`cat $S_PATH | grep "^$fin$"`
				#echo $fin
				if [ -z $yes ];then
		         	       sflag=1
        			elif [ ! -z $yes ];then
                			wflag=1
        			fi	
			done
		done
	fi
	if [ $sflag -eq 1 ] && [ $wflag -eq 0 ];then
		stat=$sstat
	elif [ $wflag -eq 1 ];then
		stat=$wstat
	fi
	echo $stat >> $OP_FILE
done<$FILE_N

IFS=$OLDIFS
