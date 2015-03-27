#!/bin/bash -l
zoneName=$1

flagfile=/tmp/sharedspace_created;
rm $flagfile
icd /$zoneName
imkdir replicate
echo "Shared space created on $(date %Y-%m-%d, %H:%M:%S)" > $flagfile
