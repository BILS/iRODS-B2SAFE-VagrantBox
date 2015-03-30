#!/bin/bash -l
zoneName=$1
hostName=$2
port=$3

flagfile=/tmp/remotezone_created;
rm $flagfile
iadmin mkzone $zoneName remote $hostName:$port
echo "Remote zone $zoneName on $hostName with port $port created on $(date %Y-%m-%d, %H:%M:%S)" > $flagfile
