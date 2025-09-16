#!/bin/bash
set -Eeuo pipefail

icon_for_image() {
  # $1 = image ref (e.g., ubuntu:22.04, debian:bookworm, alpine, fedora, archlinux, centos, rhel, suse, void)
  # Defaults to the Linux/Tux icon if no match.
  local s="${1,,}" icon=""
  case "$s" in
    *alpine*)          icon="" ;;      # nf-linux-alpine
    *ubuntu*)          icon="" ;;      # nf-linux-ubuntu
    *debian*)          icon="" ;;      # nf-linux-debian
    *fedora*)          icon="" ;;      # nf-linux-fedora
    *arch*|*manjaro*)  icon="" ;;      # nf-linux-archlinux
    *centos*)          icon="" ;;      # nf-linux-centos
    *rhel*|*redhat*)   icon="" ;;      # nf-linux-redhat
    *opensuse*|*suse*) icon="" ;;      # nf-linux-opensuse
    *void*)            icon="" ;;      # nf-linux-void
  esac
  printf %s "$icon"
}

print_menu() {
  printf '\0prompt\x1f%s\n' "  Containers"

  mapfile -t rows < <(podman ps -a --format '{{.Names}}' | sort -f || true)
  ((${#rows[@]}==0)) && { echo "— No containers —"; return; }

  local r
  for r in "${rows[@]}"; do
    img="$(podman inspect -f '{{.Config.Image}}' "$r" 2>/dev/null || \
           podman inspect -f '{{.ImageName}}' "$r" 2>/dev/null || echo "")"
    icon="$(icon_for_image "$img")"
    printf '%s  %s\0info\x1fC:%s\n' "$icon" "$r" "$r"
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

  local title="  ${cname}"
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
