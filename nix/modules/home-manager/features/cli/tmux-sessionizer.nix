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

          if [[ "$PWD" == "$REPOS/os" || "$PWD" == "$REPOS/personal" ]]; then
            clear

            return
          fi

          tmux new-window -d -n shell
          nvim
          clear
        '';
      }
    }/bin/.tmux-sessionizer";
  };
}