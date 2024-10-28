# devcontainer-dotfiles

These dotfiles are a slimmed down version of my [dotfiles](https://github.com/lore-corrias/dotifles) repository,
containing only the necessary configurations for my development containers
(basically only `nvim` and `zsh` configurations).


## How to use
I personally prefer running these dotfiles using [devpod](https://devpod.sh), meaning
that in order to run my configurations you need to setup a `devcontainer.json`
and then run:
```sh
devpod up . --ide none --dotfiles "https://github.com/lore-corrias/dotfiles@devcontainer"
```

and then connect either via docker/podman or SSH.

## Things to yet be done

- [X] Sync `nvim` clipboard with host
- [ ] Configure standard plugins for `nvim`
- [X] Maybe move to [home-manager](https://alex.pearwin.com/2021/07/managing-dotfiles-with-nix/)(?)

