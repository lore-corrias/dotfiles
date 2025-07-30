#!/bin/bash

set -euox pipefail

# Install chezmoi as one-shot to setup the dotfiles inside a devcontainer
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lore-corrias
