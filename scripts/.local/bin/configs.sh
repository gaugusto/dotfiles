#!/bin/bash

EDITOR="kitty -e nvim"

CONFIGS=(
  "Hyprland    ~/.config/hypr/hyprland.conf"
  "Hyprland    ~/.config/hypr/configs/autostart.conf"
  "Hyprland    ~/.config/hypr/configs/env_vars.conf"
  "Hyprland    ~/.config/hypr/configs/keybindings.conf"
  "Hyprland    ~/.config/hypr/configs/look-and-feel.conf"
  "Hyprland    ~/.config/hypr/configs/monitor.conf"
  "Hyprland    ~/.config/hypr/configs/my-programs.conf"
  "Hyprland    ~/.config/hypr/configs/permissions.conf"
  "Hyprland    ~/.config/hypr/configs/plugins.conf"
  "Hyprland    ~/.config/hypr/configs/quirks.conf"
  "Hyprland    ~/.config/hypr/configs/windowrules.conf"
  "Waybar      ~/.config/waybar/config.jsonc"
  "Config      ~/.local/bin/configs.sh"
  "Audio       ~/.local/bin/audio-selector.sh"
  "ClipHist    ~/.local/bin/cliphist.sh"
  "Logout Menu ~/.local/bin/logout-menu.sh"
  "Night Mode  ~/.local/bin/night-mode.sh"
  "Waybar      ~/.local/bin/restart-waybar.sh"
  "Wallset     ~/.local/bin/wallset-backend.sh"
  "Wallset     ~/.local/bin/wallset.sh"
)

CHOICE=$(printf '%s\n' "${CONFIGS[@]}" | walker -d -H)

# Se o usuário cancelar, sai do script
[ -z "$CHOICE" ] && exit 1

# 1. Pega apenas o caminho (último campo)
RAW_PATH=$(printf '%s\n' "${CHOICE}" | awk '{print $NF}')

# 2. Troca o ~ pelo caminho real da sua home
FINAL_PATH="${RAW_PATH/#\~/$HOME}"

$EDITOR "$FINAL_PATH"
