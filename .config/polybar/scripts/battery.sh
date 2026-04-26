#!/bin/bash

# Get battery percentage and status
# Make sure it's BAT0 or BAT1 (check with ls /sys/class/power_supply)
BATTERY="BAT0"
PERCENT=$(cat /sys/class/power_supply/$BATTERY/capacity)
STATUS=$(cat /sys/class/power_supply/$BATTERY/status)

# The "Surgical" Logic
if [ "$STATUS" = "Charging" ]; then
    # Charging Icon (Red) + Percent
    echo "%{F#cc0505}%{F-}  $PERCENT%"
else
    # Discharging Icon (White) + Percent
    echo "   $PERCENT%"
fi
