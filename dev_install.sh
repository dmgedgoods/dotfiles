#!/bin/bash

set -euo pipefail # Enable strict mode for better error handling

# Update and install packages in a single command
sudo apt update && sudo apt install -y gh git curl wget gettext gcc make cmake zsh

# GitHub CLI setup
gh auth login

# Dotfiles
gh repo clone dmgedgoods/dotfiles .dotfiles # Clone directly to .dotfiles
cp -r .dotfiles/.config/nvim ~/.config/

# Neovim build and install
gh repo clone neovim/neovim
(
  cd neovim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
)
sudo mv ~/neovim /opt/

# Go installation
wget -q https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz
rm go1.24.0.linux-amd64.tar.gz # Remove the downloaded archive

# Configure Go environment
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
source ~/.zshrc

# Oh My Zsh installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setup complete!"
