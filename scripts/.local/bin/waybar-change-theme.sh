#!/bin/sh

rofi_launcher="$HOME/.config/rofi/launchers/type-2"
rofi_theme='style-1'

# Diretório onde estão os arquivos CSS
CSS_DIR="$HOME/.config/waybar/themes"

# Diretório onde o link simbólico será criado
# Pode ser o mesmo do CSS_DIR
TARGET_DIR="$HOME/.config/waybar"

# Nome fixo do link simbólico
LINK_NAME="style.css"

# Seleciona o arquivo via rofi
SELECTED_CSS=$(ls "$CSS_DIR"/*.css 2>/dev/null | xargs -n 1 basename | rofi -theme ${rofi_launcher}/${rofi_theme}.rasi -dmenu -p "")

# Se nada for selecionado, sai
[ -z "$SELECTED_CSS" ] && exit 1

# Caminho completo do arquivo selecionado
CSS_PATH="$CSS_DIR/$SELECTED_CSS"

# Caminho completo do link
LINK_PATH="$TARGET_DIR/$LINK_NAME"

# Cria ou substitui o link simbólico
ln -sf "$CSS_PATH" "$LINK_PATH"

sleep 1

# Reinicia o waybar
"$HOME/.local/bin/start_waybar.sh"
