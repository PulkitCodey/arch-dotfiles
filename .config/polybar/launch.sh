#!/usr/bin/env bash

killall -q polybar

while pgrep -x polybar >/dev/null; do
  sleep 0.3
done

MONITOR=$(xrandr --query | grep " primary" | cut -d" " -f1)

if [ -z "$MONITOR" ]; then
  MONITOR=$(xrandr --query | grep " connected" | cut -d" " -f1 | head -n 1)
fi

MONITOR=$MONITOR polybar clock &

MONITOR=$MONITOR polybar battery &
