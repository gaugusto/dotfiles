#!/bin/bash

killall -9 waybar
killall -9 swaync

sleep 1

waybar &
-disown
swaync &
-disown
