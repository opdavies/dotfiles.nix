{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.cli.tmux-sessionizer.enable = mkEnableOption "Enable tmux-sessionizer";

  config = mkIf config.features.cli.tmux-sessionizer.enable {
    home.packages = with pkgs; [ tmux-sessionizer ];

    home.file.".tmux-sessionizer".source = "${
      pkgs.writeShellApplication {
        name = ".tmux-sessionizer";

        runtimeInputs = with pkgs; [
          tmux
        ];

        text = ''
          set +o errexit
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
