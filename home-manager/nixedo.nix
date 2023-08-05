{ inputs, pkgs, ... }:

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

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = 12.0;

        normal.family = "JetBrainsMono Nerd Font Mono";
        italic.style = "Regular";
        bolditalic.style = "Regular";
        bold.style = "Regular";

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = { program = "zsh"; };
    };
  };

  home.packages = with pkgs; [ discord meslo-lg slack teams vlc wofi xcape zoom-us ];
}
