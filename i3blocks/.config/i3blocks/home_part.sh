#!/bin/bash

full_text=$(df -h /home | awk 'NR==2  {print "Home: " $3 "/" $2 " (" $5 ")"}')
usage=$(df /home | awk 'NR==2  {gsub("%",""); print $5}')

echo $full_text

[ "$usage" -gt 90 ] && exit 33 || exit 0
