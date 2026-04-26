#!/bin/bash

# Terminate already running picom instances
killall -q picom

# 1. Attempt to run with dual-kawase (requires glx backend)
# Using --backend glx explicitly ensures it checks for GL support
if picom --backend glx --blur-method dual_kawase --blur-strength 5 --config ~/.config/picom/picom.conf > /dev/null 2>&1 &
then
    sleep 1 # Give it a second to see if it crashes immediately
    if pgrep -x picom > /dev/null
    then
        exit 0
    fi
fi

# 2. Fallback: Run with xrender if the above failed
picom --backend xrender --config ~/.config/picom/picom_simple.conf &
