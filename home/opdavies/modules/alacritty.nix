{
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) strings;
  inherit (strings) toInt;

  theme = import "${self}/lib/theme" { inherit pkgs; };
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "screen-256color";
      };

      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = toInt "${theme.fonts.monospace.size}";

        normal.family = "${theme.fonts.monospace.name}";

        italic.style = "Bold";
        normal.style = "Bold";

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = {
        program = "zsh";
      };
    };
  };
}
