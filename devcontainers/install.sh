#!/bin/bash

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot .
