# AGENTS.md

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/). No tests, linters, or formatters — validate changes with `chezmoi diff`.

## Profiles

Two deployment profiles controlled by `DOTFILES_PROFILE` (default: `"host"`):

| Profile | Contents |
|---------|----------|
| `host` | Full desktop (Hyprland, Waybar, Rofi, Alacritty, dunst, wlogout) |
| `devcontainer` | CLI-only (Zsh, Tmux, Neovim, dev tools from Brewfile) |

Template access: `{{ .profile }}`. `.chezmoiignore.tmpl` excludes DE files for devcontainer and `brewfile/` for host.

## Applying

```bash
chezmoi diff                              # preview changes
chezmoi apply                             # apply (host profile by default)
DOTFILES_PROFILE=devcontainer chezmoi apply  # apply for devcontainer
```

## chezmoi filename rules

| Prefix/Suffix | Effect |
|---------------|--------|
| `dot_` | `~/.filename` |
| `executable_` | Executable bit set on target |
| `private_` | Permissions 600/700 |
| `.tmpl` | Processed as Go template |

## Devcontainer bootstrap

`devcontainers/install.sh` — entry point called by devpod. One-shot:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot lore-corrias
```
Interactive devcontainer creator (uses `gum`): `~/.local/bin/create-devcontainer`

## Key locations

- `dot_config/zsh/` — Zsh config, custom scripts in `custom/`, antidote plugin manager
- `dot_config/nvim/` — Neovim (Lua, lazy.nvim); plugins in `lua/plugins/`, settings in `lua/config/`
- `dot_config/tmux/tmux.conf.tmpl` — Tmux (prefix `C-a`), TPM via `.chezmoiexternal.toml`
- `dot_config/brewfile/Brewfile` — Homebrew packages for devcontainer
- `dot_config/opencode/opencode.json` — OpenCode MCP config (Serena)
- `private_dot_local/bin/` — User scripts on `~/.local/bin`

## Zsh load order (`.zshrc`)

1. `custom/env.zsh` (immediate)
2. fzf install via `~/.fzf/install` if missing
3. antidote → generates static plugin file from `.zsh_plugins.txt`
4. `custom/history.zsh`, `custom/conda.zsh` (immediate)
5. All other `custom/*.zsh` — lazy-loaded via `zsh-defer`
6. Auto-starts tmux; uses `/tmp/tmux-$CONTAINER_ID` inside containers

## OpenCode auth (profile-dependent)

DeepSeek API key sourced from Bitwarden (`deepseek-api-key` secure note, Notes field):

- **devcontainer**: excluded by `.chezmoiignore.tmpl`. `devcontainers/install.sh` calls `~/.local/bin/opencode-auth` after `brew bundle` (requires `bw` installed + logged in or `BW_CLIENTID`/`BW_CLIENTSECRET` set).

Credentials stored in `~/.local/share/opencode/auth.json`.

## Git SSH keys (host profile)

SSH keys live in the Bitwarden agent only. A `run_once_` script extracts `.pub` files
from `ssh-add -L` at apply time for `IdentityFile` reference:

| Variable in `.chezmoi.yaml.tmpl` | Default | Used by |
|---|---|---|
| `git_ssh_login_key` | `id_ed25519_login` | `dot_gitconfig-github.tmpl` `sshCommand` |
| `git_ssh_login_label` | `github login key` | `run_once_` script — grep pattern for agent |
| `git_ssh_signing_key` | `id_ed25519_signing` | `dot_gitconfig-github.tmpl` `signingkey` |
| `git_ssh_signing_label` | `github signing key` | `run_once_` script — grep pattern for agent |

Key name is configurable in `.chezmoi.yaml.tmpl` — no private keys touch the disk.

## External dependencies (`.chezmoiexternal.toml`)

Fetched automatically by chezmoi (168h refresh period):
- `~/.config/tmux/plugins/tpm` — Tmux Plugin Manager
- `~/.fzf` — fzf (shallow clone)
- `~/.vim/autoload/plug.vim` — vim-plug
