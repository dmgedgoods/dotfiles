#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh firefox git gh gcc 

gh auth login

cd /opt
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/dmgegoods/dotfiles
cp -r dotfiles/nvim ~/.config
cp -r dotfiles/tmux ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "source packer.lua, :PackerSync, get to work!"
