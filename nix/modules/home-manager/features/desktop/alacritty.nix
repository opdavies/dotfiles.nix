{
  config,
  lib,
  ...
}:

{
  options.features.desktop.alacritty.enable = lib.mkEnableOption "Enable Alacritty";

  config = lib.mkIf config.features.desktop.alacritty.enable {
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
