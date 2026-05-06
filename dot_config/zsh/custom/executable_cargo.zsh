# Avoid sourcing the whole ~/.cargo/env unless you truly need it.
[[ -d "$HOME/.cargo/bin" ]] && path=("$HOME/.cargo/bin" $path)


