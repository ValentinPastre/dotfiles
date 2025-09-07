#!/bin/bash

#PARA CAMBIAR DE TEMA DE KITTY HAY QUE USAR EL KITTEN THEMES

set -e

HOME="/home/valentin" 
PERFIL=$1
DIR="$HOME/.config/hypr/color-profiles/$PERFIL"

cp -rf "$DIR/wal/"* ~/.cache/wal/

cp "$DIR/rofi/config.rasi" ~/.config/rofi/config.rasi

# Recargar apps
pkill waybar ; waybar -c "$DIR/waybar/r-config.json" -s "$DIR/waybar/r-style.css" &
