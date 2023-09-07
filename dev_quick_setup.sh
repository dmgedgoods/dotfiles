#!/bin/bash

## After everything is done, source packer.lua, :PackerSync and you should be g2g

sudo apt update && sudo apt upgrade -y

sudo apt-get install -y curl zsh firefox git gh gcc python3.10-venv pip3 openjdk-17-jre

cd /opt
sudo wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -zxvf /opt/nvim-linux64.tar.gz
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

sudo wget https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
sudo tar -xvf node-v18.17.1-linux-x64.tar.xz
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/node /usr/bin/node
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npm /usr/bin/npm
sudo ln -s /opt/node-v18.17.1-linux-x64/bin/npx /usr/bin/npx

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd
git clone https://github.com/dmgedgoods/dotfiles.git
cp -r dotfiles/nvim ~/.config
cp -r dotfiles/tmux ~/.config
rm -rf dotfiles

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash
chsh -s $(which zsh)
zsh


