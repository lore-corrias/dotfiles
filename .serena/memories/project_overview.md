# Project Overview

This is a **personal dotfiles repository** managed by [chezmoi](https://www.chezmoi.io/).

## Purpose
Manages configuration files for two deployment profiles:
- **host**: Full desktop environment (Hyprland, Alacritty, Waybar, Rofi, dunst, wlogout, etc.)
- **devcontainer**: Minimal CLI-only environment (no DE-related configs)

## Tech Stack
- **chezmoi** — dotfile manager (Go templates, filename conventions)
- **Zsh** — shell, with antidote plugin manager and zsh-defer for lazy loading
- **Neovim** — editor config in Lua using lazy.nvim
- **Tmux** — terminal multiplexer with TPM
- **Homebrew** — package manager (Brewfile at dot_config/brewfile/Brewfile)
- **Soar** — CLI package manager for devcontainer tools
- **fnm** — Node version manager (devcontainer)

## Profile Variable
Set via `DOTFILES_PROFILE` env var (defaults to `"host"`), accessible in Go templates as `{{ .profile }}`.

## Repo Structure
```
/workspace/
├── .chezmoi.yaml.tmpl          # chezmoi config template (defines profile)
├── .chezmoiignore.tmpl         # excludes DE configs for devcontainer
├── .chezmoiexternal.toml       # external deps (tpm, fzf, vim-plug)
├── devcontainers/install.sh    # bootstrap script for devcontainer
├── dot_config/
│   ├── alacritty/              # terminal emulator (host only)
│   ├── brewfile/Brewfile       # Homebrew packages
│   ├── dunst/                  # notification daemon (host only)
│   ├── eza/                    # ls replacement config
│   ├── hypr/                   # Hyprland WM (host only)
│   ├── mimeapps.list           # MIME associations
│   ├── noctalia/               # theme/colorscheme
│   ├── nvim/                   # Neovim config (Lua, lazy.nvim)
│   ├── rofi/                   # launcher (host only)
│   ├── tmux/tmux.conf.tmpl     # Tmux config (Go template)
│   ├── waybar/                 # status bar (host only)
│   ├── wlogout/                # logout screen (host only)
│   └── zsh/                    # Zsh config
├── dot_gitconfig               # Git config
├── dot_zshenv                  # Zsh env (sets ZDOTDIR)
├── private_dot_local/bin/      # user scripts on PATH (~/.local/bin)
└── .disabledchezmoiscripts/    # disabled chezmoi run scripts
```
