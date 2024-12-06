{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.cli.tmux-sessionizer.enable = lib.mkEnableOption "Enable tmux-sessionizer";

  config = lib.mkIf config.features.cli.tmux-sessionizer.enable {
    home.packages = with pkgs; [ custom-tmux-sessionizer ];

    home.file.".tmux-sessionizer".source = "${
      pkgs.writeShellApplication {
        name = ".tmux-sessionizer";

        runtimeInputs = with pkgs; [
          tmux
        ];

        text = ''
          set +o nounset

          tmux new-window -d -n scratch
          nvim
          clear
        '';
      }
    }/bin/.tmux-sessionizer";
  };
}
