
#!/bin/bash


strcmp(){
        s=$1
        t=$2
        ns=`printf "%d" "'${s[0]:0:1}"`
        ts=`printf "%d" "'${t[0]:0:1}"`
        i=1
        while [ $i -ge 1 ];do
                if [ $ns -ne $ts ] || [ $ns == 0 ];then
                        break
                fi
                ns=`printf "%d" "'${s[0]:$i:1}"`
                ts=`printf "%d" "'${t[0]:$i:1}"`
                #echo $ns $ts
                i=`expr $i + 1`
        done
        diff=`expr $ns - $ts`
        echo $diff
}

strlen(){
        rt=$1
        echo ${#rt}
}

strcat(){
        echo "$1""$2" 
}

temp=""
strtok(){
	str=$1
	del=$2
	i=0
	if [ -z $str ] && [ -z $temp ];then
		return
	fi
	if [ -n $str ] && [ -z $temp ];then
		temp=$str
	fi
	ps=$temp
	flag=0
	tok=$ps
	len=${#del}
	len2=${#ps}
	for ((j = 0; j < $len2 ; j++))
	do
		pstr=${ps[0]:$j:1}
		for ((i = 0 ; i < $len ; i++));do
			ds=${del[0]:$i:1}
			if [ $pstr == $ds ];then
				tok=${ps[0]:0:$j}
				jo=`expr $j + 1`
				temp=${ps[0]:$jo:$len2}
				flag=1
				break
			fi
		done
		if [ $flag -eq 1 ];then
			break
		fi
	done 	
	echo $tok
}
strstr(){
        line=`echo $1 | grep -b -o $2 | head -1`
        if [ -z $line ];then
                echo "-1"
        else
		IFS=':'
		for i in $line
		do	
			echo $i
			break
		done
        fi
}



													
