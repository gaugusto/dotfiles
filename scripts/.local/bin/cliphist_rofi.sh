#!/bin/bash

rofi_launcher="$HOME/.config/rofi/launchers/type-2"
rofi_theme='style-1'

cliphist list | rofi -dmenu -p "" -theme ${rofi_launcher}/${rofi_theme}.rasi | cliphist decode | wl-copy
