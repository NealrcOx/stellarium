#!/bin/bash

LANG=$1

if [[ $LANG == "" ]]; then
    for PO in ../../po/stellarium-skycultures-descriptions/*.po
    do
        pofilename=$(basename -- $PO)
        for i in ../../skycultures/*/description.en.utf8
        do
            po4a-translate -k 75 -o untranslated="<notr>" -f xhtml -m $i -M utf-8 -p $PO -l ${i%.*.*}.${pofilename%.*}.utf8
        done
    done
else
    for i in ../../skycultures/*/description.en.utf8
    do
        po4a-translate -k 75 -o untranslated="<notr>" -f xhtml -m $i -M utf-8 -p ../../po/stellarium-skycultures-descriptions/$LANG.po -l ${i%.*.*}.$LANG.utf8
    done
fi
