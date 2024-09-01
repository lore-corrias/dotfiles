# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias  l='eza -l  --icons always' # long list
alias ls='eza -1  --icons always' # short list
alias ll='eza -la --icons always' # long list all
alias un='sudo pacman -Rns' # uninstall package
alias up='sudo pacman -Syu' # update system/package/aur
alias pl='pacman -Qs' # list installed package
alias pa='pacman -Ss' # list availabe package
alias pc='sudo pacman -Sc' # remove unused cache
alias po='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages, also try > pacman -Qqd | pacman -Rsu --print -
alias ps='pacman -Slq | fzf --preview "pacman -Si {}" --layout=reverse'
alias psi='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'
alias lt='eza -a --tree --level=1 --icons always'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias ts='~/dotfiles/scripts/snapshot.sh'
alias wifi='nmtui'
alias rw='~/dotfiles/waybar/reload.sh'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/dotfiles"
alias cleanup='~/dotfiles/scripts/cleanup.sh'
alias ml4w='~/dotfiles/apps/ML4W_Welcome-x86_64.AppImage'
alias ml4w-settings='~/dotfiles/apps/ML4W_Dotfiles_Settings-x86_64.AppImage'

# -----------------------------------------------------
# Window Managers
# -----------------------------------------------------

alias Qtile='startx'
# Hyprland with Hyprland

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

# -----------------------------------------------------
# SCRIPTS
# -----------------------------------------------------

alias gr='python ~/dotfiles/scripts/growthrate.py'
alias ChatGPT='python ~/mychatgpt/mychatgpt.py'
alias chat='python ~/mychatgpt/mychatgpt.py'
alias ascii='~/dotfiles/scripts/figlet.sh'

# -----------------------------------------------------
# VIRTUAL MACHINE
# -----------------------------------------------------

alias vm='~/private/launchvm.sh'
alias lg='~/dotfiles/scripts/looking-glass.sh'

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confq='$EDITOR ~/dotfiles/qtile/config.py'
alias confp='$EDITOR ~/dotfiles/picom/picom.conf'
alias confb='$EDITOR ~/dotfiles/.bashrc'

# -----------------------------------------------------
# EDIT NOTES
# -----------------------------------------------------

alias notes='$EDITOR ~/notes.txt'

# -----------------------------------------------------
# SYSTEM
# -----------------------------------------------------

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias setkb='setxkbmap de;echo "Keyboard set back to de."'

# -----------------------------------------------------
# SCREEN RESOLUTINS
# -----------------------------------------------------

# Qtile
alias res1='xrandr --output DisplayPort-0 --mode 2560x1440 --rate 120'
alias res2='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 120'

# Custom 
alias zshrc='$EDITOR $ZDOTDIR/.zshrc'
alias zshconf='$EDITOR $ZSH'
