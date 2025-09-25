#!/bin/sh

# Find the battery device path dynamically
# This helps if your battery isn't always BAT0 (e.g., BAT1, or if it changes)
BATTERY_PATH=$(upower -e | grep 'battery_BAT')

# If no battery found, print an error and exit
if [ -z "$BATTERY_PATH" ]; then
    echo "No battery found"
    exit 1
fi

# Get all battery information from upower
UPOWER_INFO=$(upower -i "$BATTERY_PATH")

# Extract Capacity and Status
CAPACITY=$(echo "$UPOWER_INFO" | grep 'percentage:' | awk '{print int($2)}') # 'int' to remove decimals
STATUS=$(echo "$UPOWER_INFO" | grep 'state:' | awk '{print $2}')

# Initialize time_info variable
TIME_INFO=""
ICON=""

# Determine icon and time info based on status
if [ "$STATUS" = "charging" ]; then
    ICON="" # Charging icon ( or ⚡)
    TIME_TO_FULL=$(echo "$UPOWER_INFO" | grep 'time to full:' | awk '{print $4, $5}')
    if [ -n "$TIME_TO_FULL" ]; then
        TIME_INFO="($TIME_TO_FULL to full)"
    else
        TIME_INFO="(Charging)"
    fi
elif [ "$STATUS" = "discharging" ]; then
    if [ "$CAPACITY" -ge 90 ]; then
        ICON="" # Battery Full
    elif [ "$CAPACITY" -ge 70 ]; then
        ICON="" # Battery Three Quarters
    elif [ "$CAPACITY" -ge 50 ]; then
        ICON="" # Battery Half
    elif [ "$CAPACITY" -ge 20 ]; then
        ICON="" # Battery Quarter
    else
        ICON="" # Battery Empty
    fi
    TIME_TO_EMPTY=$(echo "$UPOWER_INFO" | grep 'time to empty:' | awk '{print $4, $5}')
    if [ -n "$TIME_TO_EMPTY" ]; then
        TIME_INFO="($TIME_TO_EMPTY)"
    fi
elif [ "$STATUS" = "fully-charged" ]; then
    ICON="" # Battery Full (or a different "full" icon)
    TIME_INFO="(Full)"
elif [ "$STATUS" = "pending-charge" ] || [ "$STATUS" = "pending-discharge" ]; then
    ICON="" # Question mark for transient states
    TIME_INFO="(Pending)"
else
    ICON="" # Question mark for unknown status
fi

# Print the final output
echo "$ICON $CAPACITY% $TIME_INFO"
