{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home-manager/modules/git.nix
    ../../home-manager/modules/home-manager.nix
    ../../home-manager/modules/tmux.nix
    ../../home-manager/modules/zsh.nix
  ];

  home.packages = with pkgs; [
    just
    neovim
    zsh
  ];

  programs.bat.enable = true;
}
