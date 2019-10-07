#!/bin/sh

# Let's set some variable that shall be used throughout the script
TARGET=10.0.2.70					# IP address of the listener
PORT=5555						# Destination port
STRING1=$(/bin/hostname)				# Just some dummy text to identify ourselves, hostname
STRING2=$(ip a | tail -n2 | awk '/inet/ {print $2}')	# ... IP address
#DATE=$(date +"%Y/%m/%d %H:%M")				# Current date
MINW=60							# Minimum wait time [s]
MAXW=300						# Maximum wait time [s]

# Main loop, the script will stay on forever
while true
do
    echo $STRING1" "$STRING2" "$(date +"%Y/%m/%d %H:%M") | /usr/bin/nc $TARGET $PORT		# Pipe the text into Netcat
    sleep $(awk -v MIN=$MINW -v MAX=$MAXW 'BEGIN{srand(); print int(MIN+rand()*(MAX-MIN+1))}')	# Sleep MINW < T < MAXW
done
