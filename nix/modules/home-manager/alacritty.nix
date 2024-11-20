{
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) strings;
  inherit (strings) toInt;

  theme = import "${self}/nix/lib/theme" { inherit pkgs; };
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

        bold.style = "Regular";
        normal.family = "${theme.fonts.monospace.name}";

        offset.y = 6;
        glyph_offset.y = 3;
      };

      terminal.shell = {
        program = "zsh";
      };
    };
  };
}
