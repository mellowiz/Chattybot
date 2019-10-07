#!/bin/sh

# Let's set some variable that shall be used throughout the script
TARGET=10.0.2.70					# IP address of the listener
PORT=5555						# Destination port
STRING1=$(/bin/hostname)				# Just some dummy text to identify ourselves, hostname
STRING2=$(ip a | tail -n2 | awk '/inet/ {print $2}')	# ... IP address
DATE=$(date +"%Y/%m/%d %H:%M")				# Current date
MINW=10							# Minimum wait time
MAXW=30							# Maximum wait time

# Main loop, the script will stay on forever
while true
do
    echo $STRING1" "$STRING2" "$DATE | /usr/bin/nc $TARGET $PORT				# Pipe the text into Netcat
    sleep $(awk -v MINW=5 -v MAXW=10 'BEGIN{srand(); print int(MINW+rand()*(MAXW-MINW+1))}')	# Sleep MINW < T < MAXW
done
