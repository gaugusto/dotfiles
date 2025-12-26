#!/bin/bash

# 1. Lista de pacotes
PACKAGES=(
  hyprland
  hypridle
  hyprlock
  kitty
  nwg-bar
  rofi
  swaync
  wlogout
  stow
  matugen
)

echo "--- Instalando pacotes via pacman ---"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# 2. Configurações de caminhos
# Assume que o script está em ~/dotfiles/
DOTFILES_DIR=$(pwd)
CONFIG_TARGET="$HOME/.config"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo -e "\n--- Iniciando o Stow (Estrutura: pasta/.config/...) ---"

# Itera sobre cada diretório (pacote) no seu diretório de dotfiles
for package in */; do
  # Remove a barra no final
  package=${package%/}

  # Caminho onde os arquivos reais estariam dentro de .config após o link
  # O Stow vai tentar linkar o que estiver dentro de 'package/.config/' para '$HOME/.config/'
  REAL_CONFIG_PATH="$DOTFILES_DIR/$package/.config"

  if [ -d "$REAL_CONFIG_PATH" ]; then
    echo "Processando pacote: $package"

    # Verifica cada item dentro da subpasta .config do pacote para fazer backup no destino
    for item in "$REAL_CONFIG_PATH"/*; do
      item_name=$(basename "$item")
      TARGET_PATH="$CONFIG_TARGET/$item_name"

      # Se o item já existir em ~/.config e não for um link, fazemos backup
      if [ -e "$TARGET_PATH" ] && [ ! -L "$TARGET_PATH" ]; then
        echo "  [Backup] Movendo $TARGET_PATH antigo..."
        mv "$TARGET_PATH" "${TARGET_PATH}_backup_$TIMESTAMP"
      elif [ -L "$TARGET_PATH" ]; then
        echo "  [Limpeza] Removendo link simbólico antigo em $item_name"
        rm "$TARGET_PATH"
      fi
    done

    # Executa o stow:
    # -R: Re-stow (limpa e refaz links)
    # -t ~: Define o target como a Home (porque o pacote já contém a pasta .config)
    stow -R -t "$HOME" "$package"
    echo "  [OK] Links para $package criados."
  fi
done

echo -e "\n--- Tudo pronto! Suas configurações estão linkadas via Stow. ---"
