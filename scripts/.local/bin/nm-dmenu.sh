#!/usr/bin/env bash

rofi_launcher="$HOME/.config/rofi/launchers/type-2"
rofi_theme='style-1'

## Run
networkmanager_dmenu \
  -theme ${rofi_launcher}/${rofi_theme}.rasi
