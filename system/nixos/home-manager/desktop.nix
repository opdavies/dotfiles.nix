{ config, inputs, pkgs, username }:

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

  services.copyq.enable = true;

  services.flameshot = {
    enable = true;

    settings = {
      General = {
        disabledTrayIcon = false;
        saveAfterCopy = true;
        savePath = "/home/${username}/Pictures/Screenshots";
        showHelp = false;
        uiColor = "#60a5fa";
      };
    };
  };

  xdg.configFile.wallpaper = {
    source = ../../../config/wallpaper;
    recursive = true;
  };
}
