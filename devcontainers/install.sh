#!/bin/bash

set -euox pipefail

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$HOME/.local/share/soar/bin:$HOME/.local/share/fnm:$PATH"

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
DOTFILES_PROFILE=devcontainer sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lore-corrias

LATEST_SOAR_VERSION=$(curl -s https://api.github.com/repos/pkgforge/soar/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=$(curl -s https://api.github.com/repos/tmux/tmux-builds/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
LATEST_TMUX_VERSION=${LATEST_TMUX_VERSION#v}

# Make sure local bin directory exists
mkdir -p "$HOME/.local/bin"

# Install Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install from Brewfile
brew bundle install --file=$HOME/.config/brewfile/Brewfile

# Install LSP skill for claude code
cd /tmp && \
  git clone https://github.com/nesaminua/claude-code-lsp-enforcement-kit.git && \\
  cd claude-code-lsp-enforcement-kit && \
  bash install.sh && 
  rm -r /tmp/claude-code-lsp-enforcement-kit

echo "Installation complete!"
