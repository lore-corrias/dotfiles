# Conventions & Style

## chezmoi filename conventions
- `dot_` prefix → becomes a dotfile (e.g. `dot_zshenv` → `~/.zshenv`)
- `executable_` prefix → sets execute bit on target file
- `private_` prefix → sets restrictive permissions (600/700)
- `.tmpl` suffix → processed as Go template before applying

## Go templates
- Profile variable: `{{ .profile }}` (values: `"host"` or `"devcontainer"`)
- Conditional: `{{ if eq .profile "devcontainer" }}...{{ end }}`

## Zsh config load order (dot_config/zsh/executable_dot_zshrc)
1. fzf setup
2. antidote plugin manager
3. `custom/history.zsh`, `custom/conda.zsh`, `custom/env.zsh` — loaded immediately
4. All other `custom/*.zsh` — lazy-loaded via zsh-defer
5. Auto-starts tmux (socket path based on `CONTAINER_ID` if in container)

## Neovim (dot_config/nvim/)
- Config language: Lua
- Plugin manager: lazy.nvim
- Plugins: `lua/plugins/`
- Settings: `lua/config/`
- Entry point: `init.lua`

## Tmux
- Prefix: `C-a`
- Plugin manager: TPM (fetched via .chezmoiexternal.toml)
- Config: `dot_config/tmux/tmux.conf.tmpl` (Go template)

## Code style
- No particular linting enforced; files are config/shell scripts
- Shell scripts use Zsh conventions
- Lua files follow standard Neovim plugin patterns
