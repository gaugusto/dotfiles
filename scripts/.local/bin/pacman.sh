#!/bin/bash

CONFIGS=(
  "Update - pacman -Syu"
  "List   - pacman -Qet"
  "Clean Cache - pacman -Sc"
  "Remove Orphans - pacman -Rs \$(pacman -Qdtq)"

)

CHOICE=$(printf '%s\n' "${CONFIGS[@]}" | walker -d -H)

# Se o usuário cancelar, sai do script
[ -z "$CHOICE" ] && exit 1

# 1. Pega apenas o caminho (último campo)
COMMAND=$(printf '%s\n' "${CHOICE}" | awk -F ' - ' '{print $NF}')

kitty -e bash -c "pkexec $COMMAND; echo; read -p 'Pressione Enter para sair...' -n1 -s"
