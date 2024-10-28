{ config, pkgs, lib, ... }:

{
  # Define the username and home directory based on environment variables
  home.username = builtins.getEnv "HOME_USERNAME";
  home.homeDirectory = "/home/${builtins.getEnv "HOME_USERNAME"}";

  home.packages = [
    pkgs.neovim
    pkgs.go
    pkgs.nodejs_22
    pkgs.fd
    pkgs.ripgrep
    pkgs.fzf
    pkgs.lazygit
    pkgs.eza
    pkgs.wl-clipboard
  ];

  # Step 2: Linking dotfiles using home.file
    home.file = {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/neovim/.config/nvim";
        ".config/zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh/.config/zsh";
        ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh/.zshenv";
    };

  home.stateVersion = "24.05";

  # this is ugly, to be improved
  imports = map (file: import "/home/${builtins.getEnv "HOME_USERNAME"}/.config/home-manager/custom/${file}") (lib.filter (name: lib.hasSuffix ".nix" name) (builtins.attrNames (builtins.readDir "/home/${builtins.getEnv "HOME_USERNAME"}/.config/home-manager/custom")));

  programs.home-manager.enable = true;
}
