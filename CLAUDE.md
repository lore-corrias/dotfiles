# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), supporting two deployment profiles:
- **host**: Full desktop environment (Hyprland, Alacritty, Waybar, Rofi, dunst, wlogout)
- **devcontainer**: Minimal CLI-only environment (Homebrew-managed tools, no DE configs)

## chezmoi Conventions

Filename prefixes/suffixes control how files are deployed:
- `dot_` → dotfile (`dot_zshenv` → `~/.zshenv`)
- `executable_` → sets execute bit on the target
- `private_` → restrictive permissions (600/700)
- `.tmpl` → processed as a Go template before applying

The profile is read from the `DOTFILES_PROFILE` env var (defaults to `"host"`) and exposed in templates as `{{ .profile }}`. It is defined in `.chezmoi.yaml.tmpl`.

## Profile Templating

Files that branch on profile:
- `.chezmoiignore.tmpl` — excludes `hypr/`, `rofi/`, `waybar/`, `alacritty/` for devcontainer; excludes `brewfile/` for host
- `dot_config/zsh/custom/executable_env.zsh.tmpl` — adds devcontainer-specific PATH entries (soar, fnm)
- `dot_config/tmux/tmux.conf.tmpl` — any profile-conditional tmux settings

## Applying Dotfiles

```bash
# Preview changes
chezmoi diff

# Apply (defaults to host profile)
chezmoi apply

# Apply for devcontainer
DOTFILES_PROFILE=devcontainer chezmoi apply

# Edit a managed file then apply
chezmoi edit ~/.config/zsh/.zshrc && chezmoi apply

# Start managing a new file
chezmoi add ~/.config/somefile
```

## Devcontainer Bootstrap

`devcontainers/install.sh` is the entry point called by devpod. It:
1. Runs `chezmoi init --apply lore-corrias` with `DOTFILES_PROFILE=devcontainer`
2. Installs Homebrew and runs `brew bundle` from `dot_config/brewfile/Brewfile`
3. Installs Serena and sets it up for Claude Code

To spin up a devcontainer workspace:
```bash
dpup <workspace-or-repo>
```
(`dpup` is defined in `.zshrc` and wraps `devpod up` with this repo and install script.)

One-shot install (no chezmoi binary kept):
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot lore-corrias
```

## Key Directories

- `dot_config/zsh/` — Zsh config; `ZDOTDIR` points here. Plugins via [antidote](https://github.com/mattmc3/antidote); custom scripts in `custom/` loaded by `.zshrc`
- `dot_config/nvim/` — Neovim config in Lua using [lazy.nvim](https://github.com/folke/lazy.nvim); plugins in `lua/plugins/`, settings in `lua/config/`, misc in `lua/misc.lua` and `lua/binds.lua`
- `dot_config/tmux/` — Tmux config (prefix `C-a`); TPM fetched via `.chezmoiexternal.toml`
- `dot_config/brewfile/Brewfile` — Homebrew packages for devcontainer (neovim, tmux, lazygit, ripgrep, fd, bat, eza, zoxide, node, uv, opencode, claude-code)
- `private_dot_local/bin/` — User scripts deployed to `~/.local/bin`

## External Dependencies (`.chezmoiexternal.toml`)

chezmoi fetches these automatically (refreshed every 168h):
- `~/.config/tmux/plugins/tpm` — Tmux Plugin Manager
- `~/.fzf` — fzf (shallow clone)
- `~/.vim/autoload/plug.vim` — vim-plug

## Zsh Load Order

`.zshrc` sources in this order:
1. fzf (installs if missing via `~/.fzf/install`)
2. antidote (installs if missing; regenerates bundle when `.zsh_plugins.txt` changes)
3. `custom/history.zsh`, `custom/conda.zsh`, `custom/env.zsh` — sourced immediately
4. All other `custom/*.zsh` — lazy-loaded via `zsh-defer`
5. Auto-starts tmux; uses a socket at `/tmp/tmux-<CONTAINER_ID>` inside containers
