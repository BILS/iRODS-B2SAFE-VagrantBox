#!/bin/bash

RESPFILE=$1
IRODSPORT=$2

echo "localhost" > $RESPFILE
echo $IRODSPORT >> $RESPFILE
echo "rods" >> $RESPFILE
echo "tempZone" >> $RESPFILE
cat /tmp/irodspass >> $RESPFILE
