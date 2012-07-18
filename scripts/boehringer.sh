#!/bin/bash
# Diese Datei holt den Speiseplan der Metzgerei Boehringer in Elgersweier ab
SCRIPTNAME=$0
OUTNAME=`basename $SCRIPTNAME .sh`
rm $OUTNAME.txt $OUTNAME.ps
links -dump "http://www.boehringer-rps.de/index2.php?site=news/details&id=7" | sed 's/a:/ae/g;s/o:/oe/g;s/u:/ue/g' > $OUTNAME.txt
enscript -B -p $OUTNAME.ps $OUTNAME.txt
ps2pdf $OUTNAME.ps $OUTNAME.pdf
rm $OUTNAME.ps $OUTNAME.txt

