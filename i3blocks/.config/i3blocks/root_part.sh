#!/bin/bash

full_text=$(df -h / | awk 'NR==2  {print "Root: " $3 "/" $2 " (" $5 ")"}')
usage=$(df / | awk 'NR==2  {gsub("%",""); print $5}')

echo $full_text

[ "$usage" -gt 90 ] && exit 33 || exit 0
