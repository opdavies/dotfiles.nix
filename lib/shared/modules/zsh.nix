{ pkgs, ... }:

{
  programs.zsh = {
    dotDir = ".config/zsh";
    enable = true;
    enableCompletion = true;

    shellAliases = (import ./zsh/aliases.nix);

    initExtra = ''
      git() {
        if [[ "''${1}" == "root" ]]; then
          shift

          local ROOT="$(${pkgs.git}/bin/git rev-parse --show-toplevel 2> /dev/null || echo -n .)"

          if [[ $# == 0 ]]; then
            cd "''${ROOT}"
          else
            (cd "''${ROOT}" && eval "''${@}")
          fi
        elif [[ "''$1" == "log" || "''$1" == "show"  ]]; then
          local command="$1"
          shift 1

          ${pkgs.git}/bin/git "$command" --ext-diff "$@"
        else
          ${pkgs.git}/bin/git "''${@}"
        fi
      }

      ttyper() {
        command ${pkgs.ttyper}/bin/ttyper --language english1000 --words 50 "''${@}"
      }

      # Case insensitive autocompletion.
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      autoload -Uz compinit && compinit

      bindkey -s ^f "t\n"
      bindkey -s ^v "nvim\n"

      clear-ls-all() {
        clear
        ls -al
        zle reset-prompt
      }
      zle -N clear-ls-all

      clear-git-status() {
        clear
        git status
        zle reset-prompt
      }
      zle -N clear-git-status

      clear-tree-2() {
        clear
        tree -L 2
        zle reset-prompt
      }
      zle -N clear-tree-2

      clear-tree-3() {
        clear
        tree -L 3
        zle reset-prompt
      }
      zle -N clear-tree-3

      bindkey '^G' clear-git-status
      # bindkey '^H' clear-tree-3
      # bindkey '^J' clear-tree-2
      # bindkey '^K' clear-ls-all

      setopt auto_cd
      setopt auto_pushd
      setopt pushd_ignore_dups
      setopt pushdminus
    '';

    zplug = {
      enable = true;

      plugins = [
        {
          name = "plugin/git";
          tags = [ "from:oh-my-zsh" ];
        }

        {
          name = "plugin/vi-mode";
          tags = [ "from:oh-my-zsh" ];
        }

        { name = "olets/zsh-abbr"; }

        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  home.file.".config/zsh-abbr/user-abbreviations".text = builtins.readFile ./zsh/abbreviations.zsh;
}
