{ pkgs, ... }:

let
  theme = import ../../lib/theme { inherit pkgs; };
in
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        # monospace = [];
      };
    };

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
