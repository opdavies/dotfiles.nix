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
        else
          ${pkgs.git}/bin/git "''${@}"
        fi
      }

      just() {
        if [[ -f .ignored/justfile ]]; then
          ${pkgs.just}/bin/just --justfile .ignored/justfile "''${@}"
        else
          ${pkgs.just}/bin/just "''${@}"
        fi
      }

      til() {
        if [[ ''${#} < 1 ]]; then
          echo "No text was provided."
          return
        fi

        echo ''${1} >> TIL.txt
      }

      todo() {
        if [[ ''${#} < 1 ]]; then
          echo "No text was provided."
          return
        fi

        echo ''${1} >> TODO.txt
      }

      ttyper() {
        command ${pkgs.ttyper}/bin/ttyper --language english1000 --words 50 "''${@}"
      }

      # Plugins
      source "''${ZPLUG_REPOS}/joshskidmore/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh"
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh"
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh"

      # Case insensitive autocompletion.
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      autoload -Uz compinit && compinit

      bindkey -s ^f "t\n"

      clear-ls-all() {
        clear
        ls -al
      }
      zle -N clear-ls-all

      clear-git-status() {
        clear
        git status -sb .
      }
      zle -N clear-git-status

      clear-tree-2() {
        clear
        tree -L 2
      }
      zle -N clear-tree-2

      clear-tree-3() {
        clear
        tree -L 3
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

        { name = "MichaelAquilina/zsh-auto-notify"; }
        { name = "olets/zsh-abbr"; }

        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  home.file.".config/zsh-abbr/user-abbreviations".text = builtins.readFile ./zsh/abbreviations.zsh;

  home.sessionVariables = {
    AUTO_NOTIFY_IGNORE = builtins.concatStringsSep " " [
      "git commit"
      "htop"
      "less"
      "man"
      "more"
      "nix develop"
      "nvim"
      "ssh"
      "tldr"
      "watch"
    ];
  };
}
