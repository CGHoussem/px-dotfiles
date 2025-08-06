#!/bin/bash

FULL_TEXT=$(df -h / | awk 'NR==2  {print "Root: " $3 "/" $2 " (" $5 ")"}')
USAGE=$(df / | awk 'NR==2  {gsub("%",""); print $5}')

echo $FULL_TEXT
echo "/: $USAGE"

[ "$USAGE" -ge 90 ] && exit 33
[ "$USAGE" -ge 70 ] && echo "#FF8000"

exit 0
