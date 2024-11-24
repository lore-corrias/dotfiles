#!/bin/bash

# https://github.com/neovim/neovim/wiki/Installing-Neovim/921fe8c40c34dd1f3fb35d5b48c484db1b8ae94b#linux
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage &&
  chmod u+x nvim.appimage &&
  ./nvim.appimage --appimage-extract &&
  mv squashfs-root / &&
  ln -s /squashfs-root/AppRun /usr/local/bin/nvim
