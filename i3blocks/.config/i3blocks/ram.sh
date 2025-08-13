#!/bin/bash

TOTAL_MEM=$(free -m | awk '/^Mem:/ {print $2}')
USED_MEM=$(free -m | awk '/^Mem:/ {print $3}')
FREE_MEM=$(free -m | awk '/^Mem:/ {print $4}')

# FULL_TEXT=$(df -h / | awk 'NR==2  {print "Root: " $3 "/" $2 " (" $5 ")"}')
# USAGE=$(df / | awk 'NR==2  {gsub("%",""); print $5}')

USAGE=$(awk "BEGIN {printf \"%.2f\", $USED_MEM/$TOTAL_MEM*100}")
FULL_TEXT="RAM: ${USED_MEM}M/${TOTAL_MEM}M ($USAGE%)"

echo $FULL_TEXT
echo "RAM: ${USAGE}%"

exit 0
