#!/bin/sh
while true
do
	RESULT=$(curl -o /dev/null -s -w %{http_code}\n ${STALKING_WHO})
	echo "Watching ${STALKING_WHO} => $RESULT"
	sleep 15
done
