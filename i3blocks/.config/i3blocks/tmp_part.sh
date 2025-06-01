#!/bin/bash

full_text=$(df -h /tmp | awk 'NR==2  {print "Tmp: " $3 "/" $2 " (" $5 ")"}')
usage=$(df /tmp | awk 'NR==2  {gsub("%",""); print $5}')

echo $full_text

[ "$usage" -gt 90 ] && exit 33 || exit 0
