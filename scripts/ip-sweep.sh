#!/bin/bash

if [ "$1" = "" ]
then
echo "Please provide an IP address"
echo "syntax: ./ipsweep.sh <first (three) network octets of an ip address>"
echo "example: ./ipsweep.sh 192.168.0"

else
for ip in `seq 1 254`
	do
		(ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &) >> iplist.txt
	done
fi
