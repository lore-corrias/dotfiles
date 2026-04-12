# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/). It supports two deployment profiles:
- **host**: Full desktop environment (Hyprland, Alacritty, Waybar, Rofi, etc.)
- **devcontainer**: Minimal CLI-only environment (no DE-related configs)

## chezmoi Conventions

chezmoi uses filename prefixes/suffixes to control how files are managed:
- `dot_` prefix → becomes a dotfile (e.g., `dot_zshenv` → `~/.zshenv`)
- `executable_` prefix → sets execute permission on the target file
- `private_` prefix → sets restrictive permissions (600/700)
- `.tmpl` suffix → processed as a Go template before applying

The profile variable is set via `DOTFILES_PROFILE` env var (defaults to `"host"`) and is accessible in templates as `{{ .profile }}`.

## Profile Templating

The profile is defined in `.chezmoi.yaml.tmpl` and used in:
- `.chezmoiignore.tmpl` — excludes DE configs (hypr, rofi, waybar, alacritty) for devcontainer, and excludes soar config for host
- `dot_config/zsh/custom/executable_env.zsh.tmpl` — adds devcontainer-specific PATH entries (soar, fnm)
- `dot_config/tmux/tmux.conf.tmpl` — any profile-conditional tmux settings

## Key Directories

- `dot_config/zsh/` — Zsh config; ZDOTDIR points here. Plugins via [antidote](https://github.com/mattmc3/antidote); custom scripts in `custom/` loaded via `executable_dot_zshrc`
- `dot_config/nvim/` — Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim); plugins in `lua/plugins/`, settings in `lua/config/`
- `dot_config/tmux/` — Tmux config with TPM (fetched via `.chezmoiexternal.toml`); prefix is `C-a`
- `dot_config/soar/` — [Soar](https://github.com/pkgforge/soar) package manager config; `packages.toml` lists CLI tools installed in devcontainer
- `devcontainers/install.sh` — Bootstraps a devcontainer: runs chezmoi one-shot, installs soar, tools via `soar apply`, fnm (Node), and Claude Code CLI
- `bin/` — User scripts placed on PATH at `~/.local/bin`

## External Dependencies (`.chezmoiexternal.toml`)

chezmoi fetches these automatically:
- `~/.config/tmux/plugins/tpm` — Tmux Plugin Manager (git repo)
- `~/.fzf` — fzf fuzzy finder (git repo, shallow)
- `~/.vim/autoload/plug.vim` — vim-plug

## Applying Dotfiles

```bash
# Apply to current machine (uses DOTFILES_PROFILE env var, defaults to "host")
chezmoi apply

# Apply for devcontainer profile
DOTFILES_PROFILE=devcontainer chezmoi apply

# Preview changes without applying
chezmoi diff

# Edit a managed file and apply
chezmoi edit ~/.config/zsh/.zshrc
chezmoi apply

# Add a new file to be managed
chezmoi add ~/.config/somefile
```

## Devcontainer Bootstrap

To spin up a devcontainer workspace with these dotfiles via devpod:
```bash
dpup <workspace-or-repo>
```
(`dpup` is defined in `.zshrc` and calls `devpod up` with the dotfiles repo and install script.)

## Zsh Structure

`.zshrc` load order:
1. fzf setup (installs if missing)
2. antidote plugin manager (installs if missing, regenerates plugin bundle when `.zsh_plugins.txt` changes)
3. `custom/history.zsh`, `custom/conda.zsh`, `custom/env.zsh` — loaded immediately
4. All other `custom/*.zsh` — lazy-loaded via `zsh-defer`
5. Auto-starts tmux (uses a socket path based on `CONTAINER_ID` if in a container)
