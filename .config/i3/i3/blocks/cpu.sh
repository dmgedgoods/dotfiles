#!/bin/sh

# Your working sar command, with a newline (\n) added for i3bar
#sar -u 1 1 | awk '/Average:/ {printf "%.1f%%\\n", 100 - $8}'
mpstat 1 1 | awk '/Average:.*all/ {print 100 - $12 "%"}'
