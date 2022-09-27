{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home-manager/modules/common.nix
    ../../home-manager/modules/git.nix
    ../../home-manager/modules/home-manager.nix
    ../../home-manager/modules/tmux.nix
    ../../home-manager/modules/zsh.nix
  ];
}
