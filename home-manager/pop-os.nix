{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/home-manager.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    docker
    docker-compose
    jetbrains-mono
    just
    meslo-lg
    neovim
  ];

  programs.bat.enable = true;
}
