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

  programs.alacritty = {
    enable = true;

    settings = {
      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = 12.0;

        normal.family = "JetBrainsMono Nerd Font";

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = { program = "zsh"; };
    };
  };
}
