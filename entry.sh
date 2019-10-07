#!/bin/sh

TARGET=10.0.2.70
PORT=5555
STRING1=$(/bin/hostname)
STRING2=$(ip a | tail -n2 | awk '/inet/ {print $2}')
MINW=10
MAXW=30
DATE=$(date +"%Y/%m/%d %H:%M")

while true
do
    echo $STRING1" "$STRING2" "$DATE | /usr/bin/nc $TARGET $PORT
    sleep $(awk -v MINW=5 -v MAXW=10 'BEGIN{srand(); print int(MINW+rand()*(MAXW-MINW+1))}')
done
