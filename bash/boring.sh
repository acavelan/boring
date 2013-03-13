#!/bin/bash

START=$1
H=$(echo "$START" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 1)
M=$(echo "$START" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 2)
S=$(echo "$START" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 3)
START=$((10#$H * 3600 + 10#$M * 60 + 10#$S))

GOAL=$2
H=$(echo "$GOAL" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 1)
M=$(echo "$GOAL" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 2)
S=$(echo "$GOAL" | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 3)
GOAL=$((10#$H * 3600 + 10#$M * 60 + 10#$S))

while [ true ]; do
	H=$(date | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 1)
	M=$(date | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 2)
	S=$(date | grep -Eo "[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}" | cut -d ':' -f 3)
	
	CURRENT=$((10#$H * 3600 + 10#$M * 60 + 10#$S))
	
	clear;
	echo $H:$M:$S
	echo "Remaining: $(($GOAL - $CURRENT))s $((($CURRENT - $START) / (($GOAL - $START) / 100)))%"
	
	sleep 1;
done;
