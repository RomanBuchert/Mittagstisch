#!/bin/bash
# Diese Datei holt den aktuellen Speiseplan von der Gewerbeakademie ab.
SCRIPTNAME=$0
OUTNAME=`basename $SCRIPTNAME .sh`
DATEI=speiseplan.pdf
wget http://www.fuessners.de/clips/speiseplan/$DATEI
mv $DATEI $OUTNAME.pdf
