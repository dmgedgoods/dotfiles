#!/bin/sh

DEVICE="ELAN1205:00 04F3:30E9 Touchpad"

# Get current state (1 for enabled, 0 for disabled)
STATE=$(xinput list-props "$DEVICE" | grep "Device Enabled" | awk '{print $NF}')

# Toggle to the opposite state
if [ "$STATE" -eq 1 ]; then
    xinput set-prop "$DEVICE" "Device Enabled" 0
else
    xinput set-prop "$DEVICE" "Device Enabled" 1
fi
