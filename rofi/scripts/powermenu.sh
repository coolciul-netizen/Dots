#!/usr/bin/env bash

# Rofi Power Menu for Gentoo Linux (Sway edition)

THEME_PATH="$HOME/.config/rofi/monochromes/monochrome-powermenu.rasi"

logout="🚪 Log Out"
reboot="🔄 Reboot"
shutdown="⚡ Power Off"

execute_action() {
    case "$1" in
        "$logout")
            swaymsg exit
            ;;
        "$reboot")
            sudo reboot
            ;;
        "$shutdown")
            sudo poweroff
            ;;
    esac
}

# Base options hiding prompt and input entry bar
ROFI_ARGS=(-dmenu -i -p "Power" -theme-str 'mainbox {children: [ listview ];}')

if [ -f "$THEME_PATH" ]; then
    ROFI_ARGS+=(-theme "$THEME_PATH")
else
    ROFI_ARGS+=(-theme-str 'window {width: 250px;} listview {lines: 5;}')
fi

chosen=$(echo -e "$logout\n$reboot\n$shutdown" | rofi "${ROFI_ARGS[@]}")

execute_action "$chosen"
