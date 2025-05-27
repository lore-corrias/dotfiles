# Detect the Linux distribution
if [ -z "$OS_ICON" -a "$(uname)" = "Linux" ]; then
  if [[ -f /etc/os-release ]]; then
    # Extract the distribution name from /etc/os-release
    DISTRO=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

    case "$DISTRO" in
      *Ubuntu*)
        export OS_ICON=""
        ;;
      *Alpine*)
        export OS_ICON=""
        ;;
      *Kali*)
        export OS_ICON=""
        ;;
      *Debian*)
        export OS_ICON=""
        ;;
      *Fedora*)
        export OS_ICON="󰮤"
        ;;
      *Arch*)
        export OS_ICON="󰣇"
        ;;
    esac
  else
    export OS_ICON="🐧"        # If no specific distro info, default to Linux penguin
  fi
fi

# Customize Pure prompt with the OS icon
export PURE_PROMPT_SYMBOL="%f${OS_ICON}%f  %F{magenta}❯"
