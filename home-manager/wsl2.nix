{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/git.nix
    ./modules/home-manager.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    just
    neovim
    zsh
  ];

  programs.bat.enable = true;
}
