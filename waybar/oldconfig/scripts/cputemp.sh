#!/bin/sh

temp=$(sensors | awk '/Package id 0:|Tctl:|CPU:/ {gsub("\\+",""); gsub("°C",""); print int($2); exit}')

echo " ${temp}°"
