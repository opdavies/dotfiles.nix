{ config, lib, pkgs, ... }:

{
  imports = [
    # ./configuration.nix

#    ../../../home-manager/modules/common.nix
#    ../../../home-manager/modules/git.nix
#    ../../../home-manager/modules/home-manager.nix
#    ../../../home-manager/modules/tmux.nix
#    ../../../home-manager/modules/zsh.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    docker
    docker-compose
    jetbrains-mono
  ];
}
