{ config, pkgs, ... }:
{
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
