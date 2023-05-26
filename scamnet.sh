#!/bin/bash

if [ "$1" == "" ]
then
echo "Esse script precisa de mais argumentos"
	echo "Ex:"
	echo "$0 192.167.150 80 "
elif [ "$2" == "" ]
then
echo "Esse script precisa de mais argumentos"
        echo "Ex:"
        echo "$0 192.167.150 80 "


else
for ip in {1..254};
do
hping3 -S  -p $2 -c 1 $1.$ip 2> /dev/null | grep "flags=SA" | cut -d " " -f 2 | cut -d "=" -f 2 ;
done 
fi
