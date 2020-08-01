#!/bin/bash

set -euo pipefail

dconf write /org/mate/desktop/session/required-components/windowmanager i3
dconf write /org/mate/desktop/session/required-components-list ['windowmanager', 'panel', 'dock']

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.config/nvim
mkdir -p ~/.config/rofi

cp -RT .config/alacritty ~/.config/alacritty
cp -RT .config/i3 ~/.config/i3
cp -RT .config/i3status ~/.config/i3status
cp -RT .config/nvim ~/.config/nvim
cp -RT .config/rofi ~/.config/rofi

cp .tmux.conf ~/.tmux.conf
cp .zshrc ~/.zshrc

echo "Done, set mate theme, logout and log back in"
