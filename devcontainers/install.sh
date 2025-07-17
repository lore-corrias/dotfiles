#!/bin/bash

set -euox pipefail

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot .

# Install tmux and useful packages
sudo apt-get update -y && sudo apt-get install -y tmux curl gpg

# Install neovim from source
sudo curl -L https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.appimage -o /nvim.appimage && \
  sudo chmod u+x /nvim.appimage && \
  sudo /nvim.appimage --appimage-extract && \
  sudo mv squashfs-root / && \
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim && \
  nvim -v

# Install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Install ripgrep
sudo apt install -y ripgrep
