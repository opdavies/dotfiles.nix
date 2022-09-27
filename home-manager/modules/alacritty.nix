{ config, pkgs, lib, libs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      font = {
        bold = {
          style = "Regular";
        };

        bold_italic = {
          style = "Italic";
        };

        normal = {
          family = "JetBrains Mono NL";
          style = "Regular";
        };

        size = 15;
      };

      window = {
        decorations = "full";
        dynamic_title = true;
      };
    };
  };
}
