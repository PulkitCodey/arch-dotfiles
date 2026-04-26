#!/bin/bash

STEP=5
MAX=200
case "$1" in
    up)
    pactl set-sink-mute @DEFAULT_SINK@ false

    CUR=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1 | tr -d '%')
    NEW=$((CUR + STEP))

    if [ "$NEW" -gt "$MAX" ]; then
        NEW=$MAX
    fi

    pactl set-sink-volume @DEFAULT_SINK@ ${NEW}%
    ;;

    down)
	pactl set-sink-mute @DEFAULT_SINK@ false
        pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
        ;;

    mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle

    MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')

    if [ "$MUTE" = "yes" ]; then
        notify-send -r 9993 "Muted"
    else
        notify-send -r 9993 "Unmuted"
    fi

    exit
    ;;
esac

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]*%' | head -1)
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    notify-send -r 9993 "Muted"
else
    notify-send -r 9993 "Volume $VOL"
fi
