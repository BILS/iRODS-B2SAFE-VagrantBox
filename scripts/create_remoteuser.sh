#!/bin/bash -l
userName=$1
zoneName=$2

flagfile=/tmp/remoteuser_created;
rm $flagfile
iadmin mkuser $userName#$zoneName rodsuser
echo "Remote user $userName#$zoneName created on $(date %Y-%m-%d, %H:%M:%S)" > $flagfile
