#!/bin/bash
set -Eeuo pipefail

print_menu() {
  printf '\0prompt\x1f%s\n' "Podman (all)"

  mapfile -t rows < <(podman ps -a --format '{{.Names}}' | sort -f || true)
  ((${#rows[@]}==0)) && { echo "— No containers —"; return; }

  local r
  for r in "${rows[@]}"; do
    # show the name, but also attach an info field we can read later
    printf '%s\0info\x1fC:%s\n' "$r" "$r"
  done
}

open_shell() {
  local cname="$1"

  # Ensure the container is running (start if stopped, unpause if paused)
  local state
  state="$(podman inspect -f '{{.State.Status}}' "$cname" 2>/dev/null || echo "")"
  if [[ "$state" == "paused" ]]; then
    podman unpause "$cname" >/dev/null 2>&1 || true
  elif [[ "$state" != "running" ]]; then
    podman start "$cname" >/dev/null 2>&1 || true
  fi

  local title="🫙 ${cname}"
  alacritty -t "$title" -e /bin/sh -c \
    "podman exec -it \"$cname\" $SHELL" \
    >/dev/null 2>&1 &
}

RET="${ROFI_RETV-0}"     # 0 init, 1 Enter, 10 custom-1 (Alt+r)
INFO="${ROFI_INFO-}"

case "${ROFI_RETV-0}" in
  0) print_menu ;;
  1)
    if [[ "${ROFI_INFO-}" == C:* ]]; then
      cname="${ROFI_INFO#C:}"
      open_shell "$cname"
    fi
    ;;
esac
