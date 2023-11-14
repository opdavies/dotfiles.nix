{ config, inputs, pkgs }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/i3.nix
  ];

  xdg.configFile.wallpaper = {
    source = ../../../config/wallpaper;
    recursive = true;
  };
}
