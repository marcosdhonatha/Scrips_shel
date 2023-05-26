#!/bin/bash

if [ "$1" == "" ]
 then 
	echo "Para usar esse script você precisa informar o site a ser explorado"
	echo "Ex:"
	echo "$0 www.globo.com.br"
else
wget $1 >> index.html 1>/dev/null | 2>/dev/null

fi

 
   grep "href"  index.html >>links

cat links | cut -d  "\"" -f 2 | grep ":" | grep -v "<link" |  sed 's/https:\/\///' |cut -d  "/" -f 1   > hosts

 sort hosts | uniq > hostsuniq


for url in $(cat hostsuniq);do
	host $url  | grep "has address"
done
