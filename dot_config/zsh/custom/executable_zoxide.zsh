#!/bin/zsh

set -u -e -o pipefail

if [ ! -f "$HOME/.local/bin/zoxide" ]; then
  echo "Do you want to install zoxide?"
  read -p -r "Y/n: " response
  if [ "$response" == "n" ]; then
    echo "zoxide not installed"
    return
  else
    echo "Installing zoxide"
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  fi
fi

eval "$(zoxide init zsh)"

