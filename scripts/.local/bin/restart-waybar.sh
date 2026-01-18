#!/bin/bash

pkill -SIGUSR2 waybar

swaync-client --reload-config
swaync-client --reload-css

# killall -9 waybar
# killall -9 swaync
#
# sleep 1
#
# waybar &
# -disown
# swaync &
# -disown
