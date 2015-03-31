#!/bin/bash -l
cmd=$1
flagfile=$2
rm $flagfile
eval $cmd
echo "Executed command $cmd on $(date +%Y-%m-%d, %H:%M:%S)" > $flagfile
