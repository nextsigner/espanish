#!/bin/bash
cat /tmp/msFF/1555462749425.txt  | grep  'silence_' | cut -d"]" -f2 | cut -d":" -f2 | \
while read CMD; 
do
	CANT=$(echo $CMD | grep -o "|" | wc -l); 
	if [ $VV = $VV2 ]	
	then	
		i=$((i + 1));
		if [ $i -gt 1 ]
		then	
			if [ $CANT = 1 ]
                	then
                        	VAL=$(echo $CMD | cut -d"|" -f1);
                        	echo "["$(bc <<< $VAL*1000 | cut -d"." -f1);
                		#echo $VA;
			else
                       		echo ","$(bc <<<  $CMD*1000 | cut -d"." -f1)"]";
                	fi
			#echo ", ";
		fi
		#echo ", ";  
	fi
	#echo ", ";
done\
| tr '\n' ' ' | sed 's/]/],/g' > '/home/nextsigner/ms.txt'
