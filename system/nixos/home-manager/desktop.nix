{ config, inputs, pkgs }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/autorandr.nix
    ./modules/espanso.nix
    ./modules/i3.nix
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "keyboard";
      };
    };
  };

  xdg.configFile.wallpaper = {
    source = ../../../config/wallpaper;
    recursive = true;
  };
}
