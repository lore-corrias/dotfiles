#!/bin/bash

set -euox pipefail

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$HOME/.local/share/soar/bin:$HOME/.local/share/fnm:$PATH"

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
DOTFILES_PROFILE=devcontainer sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lore-corrias

LATEST_SOAR_VERSION=$(curl -s https://api.github.com/repos/pkgforge/soar/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=$(curl -s https://api.github.com/repos/tmux/tmux-builds/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=${LATEST_TMUX_VERSION#v}

mkdir -p "$HOME/.local/bin"

# Install soar
wget "https://github.com/pkgforge/soar/releases/download/${LATEST_SOAR_VERSION}/soar-x86_64-linux" -O "$HOME/.local/bin/soar" && \
  chmod +x "$HOME/.local/bin/soar" && \

# Add alacritty terminfo
curl -LO https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -x alacritty.info && rm alacritty.info

# Installing tools
echo "Installing tools via Soar..."

soar apply -y

soar add -y lazygit
soar add -y fd
soar add -y zoxide
soar add -y bat
soar add -y eza

mkdir -p "$HOME/.local/share/fnm"
curl -fsSL https://fnm.vercel.app/install | bash -s -- -d "$HOME/.local/share/fnm"
fnm install --lts

echo "Installation complete!"
