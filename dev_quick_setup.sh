#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh firefox git gh gcc 

cd /opt
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd
git clone https://github.com/dmgedgoods/dotfiles.git
cp -r dotfiles/nvim ~/.config
cp -r dotfiles/tmux ~/.config

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
chsh -s $(which zsh)
zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.zshrc
nvm install 20

echo "source packer.lua, :PackerSync, get to work!"
