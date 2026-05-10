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

# Install alacritty terminfo
curl -LO https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info && tic -x alacritty.info && rm alacritty.info

# Install Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install from Brewfile
brew bundle install --file=$HOME/.config/brewfile/Brewfile

# Configure OpenCode credentials from Bitwarden
opencode-auth || echo "[!] opencode-auth failed — run it manually after setting up Bitwarden"

# Install and configure serena for claude
uv tool install -p 3.13 serena-agent@latest --prerelease=allow && \
  serena setup claude-code

echo "Installation complete!"
