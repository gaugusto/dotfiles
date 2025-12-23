#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-6'

WALL_DIR="$HOME/Imagens/Wallpaper-Bank/wallpapers"

CWD="$(pwd)"

cd "$WALL_DIR" || exit

# Handle spaces in filenames
IFS=$'\n'

SELECTED_WALL=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n"; done | rofi -dmenu -p -theme ${dir}/${theme}.rasi "")

if [ -n "$SELECTED_WALL" ]; then
  $HOME/.local/bin/wallset-backend.sh "$WALL_DIR/$SELECTED_WALL"
fi

cd "$CWD" || exit
