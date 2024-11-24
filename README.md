# dotfiles
my personal dotfiles :>

## Main programs
I use Fedora with [Hyprland](https://hyprland.org), and my configurations are heavily based on [ML4W](https://www.ml4w.com/)'s dotfiles (which means that they almost surely also work on Arch).

I also really like [Catppuccin](https://www.catppuccin.com), so I put it almost anywhere I can!

## Usage
In order to manage my dotfiles, I recently moved to [chezmoi](https://www.chezmoi.io/) as that's the most flexible tool for my needs. This is because this repo is also transitioning to support the same configurations for multiple environments, including [devcontainers](https://containers.dev/) (but that's still a work in progress).

If you want to use my dotfiles, you can do so by using chezmoi with this command:
```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply lore-corrias
```
and that's it! You can now manage your dotfiles with chezmoi. If you don't want to use the chezmoi binary, you can add the `--one-shot` flag:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot lore-corrias
```

> [!WARNING]
> I moved to chezmoi recently, so I am still trying to figure some things out!

## What will you need?
Theoretically, not much. At this moment the dotfiles automatically install these packages using `chezmoi`:
```plain
nvim
zsh
fd-find
ripgrep
tmux
```
But this list is notably missing a log of packages that I use, notably most of those regarding my Desktop Environment. Here is a non-comprehensive list, in the future I'll find a way to automate the installation process:

```
hyprland
waybar
rofi-wayland
alacritty
dunst
Thunar
xdg-desktop-portal-hyprland
qt5-qtwayland
qt6-qtwayland
hyprpaper
hyprlock
firefox
fontawesome-6-free-fonts
python3-pip
mozilla-fira-sans-fonts
fira-code-fonts
wlogout
python3-gobject"
gtk4
network-manager-applet
```

### Monitor
Remember to configure your monitor on `~/.config/hypr/conf/monitor.conf` using:
```bash
hyprctl monitors all
```

### TODO List

- [ ] Automate the installation of all packages
- [ ] Provide a way to distinguish between devcontainers and other environments: some configs change (for example, devcontainers don't need `tmux`)
- [ ] Add a `install.sh` to allow automatic import of dotfiles with [devpod](https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace)
