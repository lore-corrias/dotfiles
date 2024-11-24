# dotfiles
my personal dotfiles :>

## Main programs
I use Fedora with [Hyprland](https://hyprland.org), and my configurations are heavily based on [ML4W](https://www.ml4w.com/)'s dotfiles (which means that they almost surely also work on Arch.

I also really like [Catppuccin](https://www.catppuccin.com), so I put it almost anywhere I can!

## Usage
I use [GNU Stow](https://www.gnu.org/software/stow/) to manage my dotfiles. If you want to install them, here's a list of all of the required programs (for Fedora, that is):

> [!WARNING] 
> Some packages are still missing from the list! I'll add them as I remember them.

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
vim
vim-enhanced
python3-pip
fastfetch
mozilla-fira-sans-fonts
fira-code-fonts
wlogout
python3-gobject"
gtk4
network-manager-applet
zsh
```

You'd also need to install [oh-my-zsh](https://ohmyz.sh).

Of course you can also use ML4W's offical install script to install everything:
```bash
bash <(curl -s https://raw.githubusercontent.com/mylinuxforwork/hyprland-starter/main/setup.sh)
```

Regardless of how you install your packages, you can then use my dotfiles with stow:
```bash
stow --verbose --target=$HOME --restow */
```

### Monitor
Remember to configure your monitor on `~/.config/hypr/conf/monitor.conf` using:
```bash
hyprctl monitors all
```
