{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Terminess Nerd Font" ];
      };
    };

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.terminess-ttf
    ];
  };
}
