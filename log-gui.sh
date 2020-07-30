#!/bin/bash

#By Deucalion

PannelGUi(){

PARSER='{font=""; color="#2a2828"}; \
/kernel/ {font="italic"}; \
/warn/ {color="#e77b22"}; \
/error/ {color="#f34141"}; \
OFS="\n" {print $1 " " $2, $3, $4, substr($5,0,index($5,":")-1), \
substr($0,index($0,$6)), font, color; fflush()}'

tail -f $LOGFILE | awk "$PARSER" | \
yad --title="Log GUI By Deucalion" --window-icon=logviewer \
    --geometry 1600x750 \
    --list --text="Log de $LOGFILE," \
    --column Date --column Time --column Host \
    --column Tag --column Message:TIP \
    --column @font@ --column @back@
}



LOGFILE=`yad --entry \
             --title="Which file do you want to watch ?" \
             --geometry 400x80`
if [ -e $LOGFILE ]
then
    PannelGUi
else
    yad --title="Error"\
        --geometry 200x80 \
        --text="File not found"\
        --text-align="center"

fi







