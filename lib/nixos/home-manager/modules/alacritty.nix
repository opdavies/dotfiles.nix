{
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib) strings;
  inherit (strings) toInt;

  theme = import "${self}/lib/theme" {inherit pkgs;};
in {
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = toInt "${theme.fonts.monospace.size}";

        bold.style = "Regular";
        normal.family = "${theme.fonts.monospace.name}";

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = {program = "zsh";};
    };
  };
}
