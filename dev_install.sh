#!/bin/bash

sudo apt update
sudo apt install gh git curl wget gettext gcc make cmake zsh
gh auth login
gh repo clone dmgedgoods/dotfiles
mv dotfiles .dotfiles
gh repo clone neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
sudo mv ~/neovim /opt
cp -r ~/.dotfiles/.config/nvim ~/.config/
cd ~/
wget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ~/go1.24.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
