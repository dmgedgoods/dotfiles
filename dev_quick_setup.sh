#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh

sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz /opt
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/dmgegoods/.dotfiles
cp -r .dotfiles/nvim ~/.config
cp -r .dotfiles/tmux ~/.config

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Done! Get to work!"
