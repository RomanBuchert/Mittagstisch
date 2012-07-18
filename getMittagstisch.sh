#!/bin/bash
#Holt die Speiseplaene ab und wandelt diese in ein einzelnes PDF.
#Die Scripte muessen im Verzeichnis script liegen und als Ausgabe eine PDF-Datei mit dem Mittagstisch ausgeben.
MAILUSERS="\
 -b roman.buchert@arcor.de\
 -b roman.buchert@googlemail.com\
 -b rb@huber-online.com\
 -b eb@huber-online.com\
 -b eg@huber-online.com\
 -b hem@westiform.de\
 -b cjd-offenburg@westiform.de\
 "

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
echo "Mittagstisch der KW"`date +%V` > $SCRIPTDIR/Mail.txt
echo "Diese Mail und der Anhang wurde automatisch generiert und beruecksichtigt folgende Kantinen:" >> $SCRIPTDIR/Mail.txt
ls $SCRIPTDIR/scripts/*.pdf | xargs -l -I '{}'  basename '{}' .pdf | xargs -l  -I '{}' echo "  *" '{}' >> $SCRIPTDIR/Mail.txt
echo "" >> $SCRIPTDIR/Mail.txt
echo "" >> $SCRIPTDIR/Mail.txt
echo "Diese Mail wurde automatisch erstellt. Bitte nicht darauf Antworten." >> $SCRIPTDIR/Mail.txt
echo "Rueckfragen an roman.buchert(bei)arcor.de" >> $SCRIPTDIR/Mail.txt
echo "(C)" `date +%Y` "by Roman Buchert" >> $SCRIPTDIR/Mail.txt

mutt -s "Mittagstisch KW"`date +%V` $MAILUSERS -a $SCRIPTDIR/Mittagstisch.pdf -- mapsten@arcor.de < Mail.txt
