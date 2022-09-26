{ config, pkgs, lib, libs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    shellAliases = {
      run = "./run";
    };

    autocd = true;
    cdpath = [
      "$HOME/Code"
      "$HOME/Code/*"
      "$HOME"
    ];

    initExtra = ''
      # Case insensitive autocompletion.
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      autoload -Uz compinit && compinit

      # No arguments: `git status`
      # With arguments: acts like `git`
      g() {
        if [[ $# -gt 0 ]]; then
          git "$@"
        else
          git status
        fi
      }
    '';

    zplug = {
      enable = true;

      plugins = [
        { name = "mollifier/cd-gitroot"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };
}
