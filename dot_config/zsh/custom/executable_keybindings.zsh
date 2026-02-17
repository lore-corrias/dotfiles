# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'

# Insert mode
bindkey -M viins '^[[1;5D' backward-word
bindkey -M viins '^[[1;5C' forward-word
# Command mode
bindkey -M vicmd '^[[1;5D' backward-word
bindkey -M vicmd '^[[1;5C' forward-word

bindkey -M viins "^[[3;5~" kill-word
bindkey -M vicmd "^[[3;5~" kill-word
bindkey -M viins '^H' backward-kill-word
bindkey -M vicmd '^H' backward-kill-word

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
