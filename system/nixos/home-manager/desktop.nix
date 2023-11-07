{ config, inputs, pkgs }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/sway.nix
  ];

  xdg.configFile.wallpaper = {
    source = ../../../config/wallpaper;
    recursive = true;
  };
}
