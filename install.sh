#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Installing home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

echo "Setting up Home Manager using home.nix..."

mkdir -p "$HOME/.config/home-manager/custom"
ln -sf "$PWD/home.nix" "$HOME/.config/home-manager/home.nix"

# Run home manager
nix-shell '<home-manager>' -A install

# Apply the configurations inside home.nix
export PATH="$PATH:$HOME/.nix-profile/bin"
source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
home-manager switch
