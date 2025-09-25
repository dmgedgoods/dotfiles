#!/bin/sh

color0="#00ccff"
color1="#00e600"
color2="#ffff00"
color3="#ff9900"
color4="#ff0000"

temp_info="$(sysctl -n dev.cpu.1.temperature | cut -c 1-2)"
temp_print="$(sysctl -n dev.cpu.1.temperature | cut -c 1-2) °C"

if [ "$temp_info" -ge 01 ] && [ "$temp_info" -le 50 ]; then
    echo "$temp_print"
    echo "$temp_print"
    echo "$color0"
elif [ "$temp_info" -gt 50 ] && [ "$temp_info" -le 60 ]; then
    echo "$temp_print"
    echo "$temp_print"
    echo "$color1"
elif [ "$temp_info" -gt 60 ] && [ "$temp_info" -le 70 ]; then
    echo "$temp_print"
    echo "$temp_print"
    echo "$color2"
elif [ "$temp_info" -gt 70 ] && [ "$temp_info" -le 80 ]; then
    echo "$temp_print"
    echo "$temp_print"
    echo "$color3"
elif [ "$temp_info" -gt 80 ] && [ "$temp_info" -le 95 ]; then
    echo "$temp_print"
    echo "$temp_print"
    echo "$color4"
fi
