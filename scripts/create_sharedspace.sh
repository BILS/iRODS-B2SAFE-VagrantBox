#!/bin/bash -l
flagfile=/tmp/sharedspace_created;
rm $flagfile
icd /tempZone
imkdir replicate
echo "Shared space created on $(date %Y-%m-%d, %H:%M:%S)" > $flagfile
