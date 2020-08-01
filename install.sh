#!/bin/bash

set -euo pipefail

if [ $EUID -ne 0 ]; then
	echo "Run with sudo"
	exit 1
fi

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

apt-get update
apt-get install apt-transport-https
apt-get install i3 zsh gimp chromium-browser neovim remmina htop gparted vlc code rofi fonts-powerline numix-icon-theme adapta-gtk-theme dconf-cli

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done, install latest alacritty"
