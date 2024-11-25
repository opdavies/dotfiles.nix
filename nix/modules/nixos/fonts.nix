{ pkgs, ... }:

let
  theme = import ../../lib/theme { inherit pkgs; };
in
{
  environment.systemPackages = with pkgs; [
    terminus_font
    terminus_font_ttf
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ theme.fonts.monospace.name ];
      };
    };

    packages =
      with pkgs;
      [
        (nerdfonts.override {
          fonts = [
            "AnonymousPro"
            "FiraCode"
            "GeistMono"
            "IntelOneMono"
            "Iosevka"
            "JetBrainsMono"
          ];
        })
      ]
      ++ [ theme.fonts.monospace.package ];
  };
}
