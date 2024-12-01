#!/bin/zsh

set -u -e -o pipefail

# podman autocompletion
if [ command -v podman 2>&1 >/dev/null ]; then
  autoload -U compinit
  compinit
  podman completion -f "${fpath[1]}/_podman" zsh
fi

