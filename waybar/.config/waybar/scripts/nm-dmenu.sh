#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-6'

## Run
networkmanager_dmenu \
    -show drun \
    -theme ${dir}/${theme}.rasi
