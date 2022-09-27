{ config, pkgs, lib, libs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    shellAliases = {
      fetch = "git fetch --all --jobs=4 --progress --prune";
      run = "./run";
      pull = "git pull --autostash --jobs=4 --summary origin";
      rebase = "git rebase --autostash --stat";
      update = "fetch && rebase";
    };

    autocd = true;
    cdpath = [
      "$HOME/Code"
      "$HOME/Code/*"
      "$HOME"
    ];

    initExtra = ''
      if [ -f ~/.config/zsh/.p10k.zsh ]; then
        . ~/.config/zsh/.p10k.zsh
      fi

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
