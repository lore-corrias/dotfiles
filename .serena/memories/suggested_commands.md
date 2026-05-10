# Suggested Commands

## chezmoi workflow
```bash
# Apply dotfiles (uses DOTFILES_PROFILE env var, defaults to "host")
chezmoi apply

# Apply for devcontainer profile
DOTFILES_PROFILE=devcontainer chezmoi apply

# Preview changes without applying
chezmoi diff

# Edit a managed file and apply
chezmoi edit ~/.config/zsh/.zshrc && chezmoi apply

# Add a new file to manage
chezmoi add ~/.config/somefile
```

## Devcontainer bootstrap
```bash
# Spin up a devcontainer workspace via devpod
dpup <workspace-or-repo>
```

## Git
```bash
git status
git diff
git log --oneline
git add <file> && git commit -m "message"
```

## No linting/testing commands
This is a dotfiles repo — there are no test suites, linters, or formatters to run.
Validation is done by `chezmoi diff` and manual inspection.
