#!/bin/bash

set -euox pipefail

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$HOME/.local/share/soar/bin:$HOME/.local/share/fnm:$PATH"

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
DOTFILES_PROFILE=devcontainer sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lore-corrias

# Installing tools
echo "Installing tools via Soar..."

LATEST_SOAR_VERSION=$(curl -s https://api.github.com/repos/pkgforge/soar/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=$(curl -s https://api.github.com/repos/tmux/tmux-builds/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=${LATEST_TMUX_VERSION#v}

mkdir -p "$HOME/.local/bin"

# Install soar
wget "https://github.com/pkgforge/soar/releases/download/${LATEST_SOAR_VERSION}/soar-x86_64-linux" -O "$HOME/.local/bin/soar" && \
  chmod +x "$HOME/.local/bin/soar" && \

# Install tmux
wget "https://github.com/tmux/tmux-builds/releases/download/v${LATEST_TMUX_VERSION}/tmux-${LATEST_TMUX_VERSION}-linux-x86_64.tar.gz" -O "/tmp/tmux.tar.gz" && \
  tar -xzf /tmp/tmux.tar.gz -C "/tmp" && \
  mv /tmp/tmux "$HOME/.local/bin/" && \
  chmod +x "$HOME/.local/bin/tmux"

soar add -y neovim
soar add -y lazygit
soar add -y ripgrep
soar add -y fd
soar add -y fzf
soar add -y zoxide
soar add -y bat
soar add -y eza

# Installing node via fast node manager
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lts 

echo "Installation complete!"
