#!/bin/bash

if [ "$1" == "" ]
 then
	echo "Para usar esse script vc precisa fornecer a rede a ser explorada"
	echo "Ex:"
	echo "$0 150.164.120"
else
	for rede in $(seq 1 254);
		do
		  ping -c 1 $1.$rede | grep "64 bytes" | cut -d " " -f 4 | sed 's/.$//';
done
fi
