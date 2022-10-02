{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/common.nix
    ./modules/git.nix
    ./modules/home-manager.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  home.stateVersion = "22.05";

  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";
}
