#!/bin/sh

# This script toggles between a multi-monitor setup and a laptop-only setup.

# We check if the external 1440p monitor (DP-1-0.2) is currently connected and active.
# 'grep -q' runs quietly and its exit status tells us if a match was found.
if xrandr --query | grep -q "DP-1-0.2 connected 2560x1440"; then
    # If the external monitor IS active, switch to the LAPTOP-ONLY configuration.
    xrandr --output eDP-1 --mode 1920x1080 --refresh 60.01 --output DP-1-0.2 --off --output DP-1-0.1 --off
else
    # If the external monitor IS NOT active, switch to the MULTI-MONITOR configuration.
    xrandr --output DP-1-0.2 --mode 2560x1440 --primary --refresh 60.00 --output DP-1-0.1 --mode 1920x1080 --refresh 74.97 --right-of DP-1-0.2 --rotate right --output eDP-1 --off
fi

# After changing the monitor setup, wait a moment and then set the wallpaper.
sleep 1
feh --bg-fill ~/.background-image/wood.jpg

