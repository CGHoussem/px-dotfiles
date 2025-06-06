#!/bin/bash

FULL_TEXT=$(df -h /home | awk 'NR==2  {print "Home: " $3 "/" $2 " (" $5 ")"}')
USAGE=$(df /home | awk 'NR==2  {gsub("%",""); print $5}')

echo $FULL_TEXT
echo $FULL_TEXT

[ "$USAGE" -ge 90 ] && exit 33
[ "$USAGE" -ge 70 ] && echo "#FF8000"

exit 0
