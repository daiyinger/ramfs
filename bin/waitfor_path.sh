#! /bin/sh
file=$1
while true
do
        if [ ! -e "$file" ]; then 
                #echo "wait file is $file"
        	sleep 0.1
                continue
        fi      
        #echo "before break"
        break   
done    
#echo "file $file exit"

