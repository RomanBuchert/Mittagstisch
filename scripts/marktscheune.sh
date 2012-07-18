#!/bin/bash
# Diese Datei holt den aktuellen Speiseplan von der Marktscheune in Berghaupten ab.
SCRIPTNAME=$0
OUTNAME=`basename $SCRIPTNAME .sh`
DATEI=Wochenkarte_`date +%V`.pdf

wget http://www.markt-scheune.com/$DATEI
mv $DATEI $OUTNAME.pdf
