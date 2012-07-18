#!/bin/bash
#Holt die Speiseplaene ab und wandelt diese in ein einzelnes PDF.
#Die Scripte muessen im Verzeichnis script liegen und als Ausgabe eine PDF-Datei mit dem Mittagstisch ausgeben.
SCRIPTDIR=/home/rb/Dokumente/Mittagstisch
cd $SCRIPTDIR/scripts/
rm *.pdf
for i in *.sh; do 
    if [ -x $i ]; then
	./$i
    fi
done;
cd ..
pdfjoin --pdftitle "Mittagstisch KW"`date +%V` --pdfauthor "Roman Buchert" --rotateoversize 'false' --outfile $SCRIPTDIR/Mittagstisch.pdf `ls $SCRIPTDIR/scripts/*.pdf`

