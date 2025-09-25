#!/bin/sh

awk '
  /MemTotal/ {total=$2}
  /MemAvailable/ {avail=$2}
  END {if (total > 0) printf "%.1f%%\n", (total-avail)*100/total}
' /proc/meminfo
