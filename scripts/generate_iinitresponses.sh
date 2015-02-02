#!/bin/bash

RESPFILE=$1

echo "localhost" > $RESPFILE
echo "1247" >> $RESPFILE
echo "rods" >> $RESPFILE
echo "tempZone" >> $RESPFILE
cat /tmp/irodspass >> $RESPFILE
