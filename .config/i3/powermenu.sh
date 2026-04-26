  GNU nano 7.2               /home/elliot/.config/i3/powermenu.sh
#!/bin/bash

options="Shutdown\nReboot\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu \
    -theme ~/.config/rofi/powermenu.rasi \
    -p "")

case "$chosen" in
    Shutdown) shutdown now ;;
    Reboot) reboot ;;
    Logout) i3-msg exit ;;
esac
