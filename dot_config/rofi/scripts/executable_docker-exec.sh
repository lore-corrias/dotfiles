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

  # Single call to gather everything we need: name, image, status, and manager label
  # Note: .Image is fine for icon matching; .Label "manager" returns empty if unset
  mapfile -t rows < <(
    docker ps -a \
      --format '{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Label "manager"}}' \
      --filter "label=manager=devpod" \
      | sort -f || true
  )
  ((${#rows[@]}==0)) && { echo "— No containers —"; return; }

  local line name img status manager icon
  for line in "${rows[@]}"; do
    IFS=$'\t' read -r name img status manager <<< "$line"
    icon="$(icon_for_image "${img:-}")"

    # Pass everything we need via ROFI_INFO:
    # C:<name> | S:<status> | M:<manager>
    printf '%s  %s\0info\x1fC:%s|S:%s|M:%s\n' \
      "$icon" "$name" "$name" "$status" "${manager:-}"
  done
}

open_shell() {
  # INFO looks like: "C:<name>|S:<status>|M:<manager>"
  local info="$1" cname state manager
  cname="${info#C:}"; cname="${cname%%|*}"
  state="${info#*|S:}"; state="${state%%|*}"
  manager="${info#*|M:}"

  # Normalize state to a simple keyword if possible (running, paused, exited, etc.)
  # `docker ps` .Status often starts like "Up 5 minutes" or "Exited (0) ...".
  local simple="unknown"
  case "${state,,}" in
    running*|up*) simple="running" ;;
    paused*)      simple="paused" ;;
    exited*|created*|dead*|removing*|stopped*) simple="stopped" ;;
  esac

  # Ensure the container is running (start if stopped, unpause if paused)
  if [[ "$simple" == "paused" ]]; then
    docker unpause "$cname" >/dev/null 2>&1 || true
  elif [[ "$simple" != "running" ]]; then
    docker start "$cname" >/dev/null 2>&1 || true
  fi

  local title="  ${cname}"
  if [[ "$manager" == "distrobox" ]]; then
    alacritty -t "$title" -e /bin/sh -c \
      "/usr/sbin/distrobox enter \"$cname\" -- zsh" \
      >/dev/null 2>&1 &
  else
    # Prefer container's declared shell if available; fall back to /bin/sh
    # Using sh -lc ensures $SHELL is resolved inside the container if set
    alacritty -t "$title" -e /bin/sh -c \
      "docker exec -it \"$cname\" sh -lc '\${SHELL:-/bin/zsh}'" \
      >/dev/null 2>&1 &
  fi
}

RET="${ROFI_RETV-0}"
INFO="${ROFI_INFO-}"

case "$RET" in
  0) print_menu ;;
  1)
    if [[ -n "${INFO-}" && "$INFO" == C:* ]]; then
      open_shell "$INFO"
    fi
    ;;
esac

