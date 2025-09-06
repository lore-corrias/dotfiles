export EDITOR="nvim"
# TODO: Add a script that runs ptyxis through flatpak and reference it here
export TERMINAL="app.devsuite.Ptyxis"

export PATH="$PATH:$HOME/.local/bin"
if [ -d "$HOME/.spicetify" ]; then
  export PATH=$HOME/.poba:$PATH
fi

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
