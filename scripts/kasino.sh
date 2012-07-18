#!/bin/bash
#Diese Datei holt den Speiseplan der Kasino GmbH ab.
SCRIPTNAME=$0
OUTNAME=`basename $SCRIPTNAME .sh`
DATEI=plan.pdf
wget http://kasino-gmbh.de/Pdf/$DATEI
mv $DATEI $OUTNAME.pdf
