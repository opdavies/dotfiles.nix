{
  config,
  lib,
  ...
}:

with lib;

{
  options.features.desktop.alacritty.enable = mkEnableOption "Enable Alacritty";

  config = mkIf config.features.desktop.alacritty.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        env = {
          TERM = "screen-256color";
        };

        window.padding = {
          x = 10;
          y = 10;
        };

        font = {
          size = 10;

          bold.style = "Regular";
          normal.family = "JetBrainsMono Nerd Font Mono";
        };

        terminal.shell = {
          program = "zsh";
        };
      };
    };
  };
}
