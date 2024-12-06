#!/bin/bash

xrandr --output eDP-1 --mode "1920x1080" --scale 1x1
xrandr --output DP-1-0.1 --mode "1920x1080" --rate "60.00" --right-of HDMI-1-0 --rotate right --scale 1x1
xrandr --output HDMI-1-0 --mode "2560x1440" --rate "60.00" --right-of eDP-1 --scale 1x1


