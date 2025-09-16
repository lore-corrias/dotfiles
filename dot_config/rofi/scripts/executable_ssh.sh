#!/usr/bin/env bash
set -Eeuo pipefail

HOST=${1:-}
COMMAND=(ssh)
DEVPOD_SUFFIX=".devpod"

# matches something like "name.devpod" exactly
# if [[ "$HOST" =~ ^[[:alnum:]]+\.devpod$ ]]; then
#   COMMAND=(devpod ssh --command zsh)
#   HOST="${HOST%$DEVPOD_SUFFIX}"   # strip trailing .devpod
# fi

exec "${COMMAND[@]}" "$HOST"
