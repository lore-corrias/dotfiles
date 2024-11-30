#!/bin/bash

# devtools list
devtools=(
  "neovim"
  "fzf"
  "tmux"
  "fd-find"
  "ripgrep"
)
devtools_joined=$(printf '"%s" ' "${devtools[@]}")
devtools_comma_separated=$(
  IFS=','
  echo "${devtools[*]}"
)

# Stealing this from https://github.com/mylinuxforwork/dotfiles/blob/main/setup-fedora.sh#L127
bash <(curl -s https://raw.githubusercontent.com/mylinuxforwork/dotfiles/main/share/packages/fedora/special/gum.sh)

gum style \
  --foreground 255 --border-foreground 255 --border double \
  --align center --width 60 --margin "1 2" --padding "1 3" \
  'devtools installer'

if gum confirm "Do you want to install the devtools required for the dotfiles?"; then
  chosen_tools="$(eval "gum choose --header \"Choose which of these devtools will be installed inside the devcontainer:\" --no-limit $devtools_joined --selected \"$devtools_comma_separated\"")"
  for chosen_tool in $chosen_tools; do
    source "./run_onchange_install-${chosen_tool}.sh"
  done
fi
