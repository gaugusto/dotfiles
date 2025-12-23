#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-2"
theme='style-1'

## Run
networkmanager_dmenu \
  -show drun \
  -theme ${dir}/${theme}.rasi
