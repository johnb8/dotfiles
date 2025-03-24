#!/bin/bash

set -euo pipefail

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

wget -qO- https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x1a37a23d9ecd9a83 | gpg --dearmor > plata-theme.gpg
sudo install -D -o root -g root -m 644 plata-theme.gpg /etc/apt/keyrings/plata-theme.gpg
echo "deb [signed-by=/etc/apt/keyrings/plata-theme.gpg] https://ppa.launchpadcontent.net/tista/plata-theme/ubuntu groovy main\ndeb-src [signed-by=/etc/apt/keyrings/plata-theme.gpg] https://ppa.launchpadcontent.net/tista/plata-theme/ubuntu groovy main" |sudo tee /etc/apt/sources.list.d/plata-theme.list > /dev/null
rm -f plata-theme.gpg

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install curl i3 zsh gimp chromium neovim remmina htop gparted vlc code rofi fonts-powerline numix-icon-theme dconf-cli alacritty tmux plata-theme

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Done"
