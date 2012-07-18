#!/bin/bash
# Diese Datei holt den Speiseplan der Baeckerei Rieger in Elgersweier ab
#wget http://rieger-baeckerei.de/filiale-elgersweier.html
SCRIPTNAME=$0
OUTNAME=`basename $SCRIPTNAME .sh`

html2ps -o $OUTNAME.ps http://rieger-baeckerei.de/filiale-elgersweier.html
ps2pdf $OUTNAME.ps $OUTNAME.pdf
rm $OUTNAME.ps
