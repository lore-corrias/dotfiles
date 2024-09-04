# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$ZDOTDIR/custom/*.zsh

source ~/.config/zsh/custom/plugins.zsh

# plugins=(sudo fzf zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

   exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

eval "$(zoxide init zsh)"

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
