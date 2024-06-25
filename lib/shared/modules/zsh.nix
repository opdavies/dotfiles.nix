{ pkgs, ... }:

{
  programs.zsh = {
    dotDir = ".config/zsh";
    enable = true;
    enableCompletion = true;

    # Aliases (which don't expand).
    shellAliases = {
      "-" = "cd -";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      cat = "bat";
      run = "./run";
      s = "secrets";
      secrets = ''doppler --project "$(whoami)" run'';
      tag = "tag-release";
      wt = "git worktree";
      vss = "LC_ALL=C sort --unique ~/Code/personal/opdavies.nvim/spell/en.utf-8.add --output ~/Code/personal/opdavies.nvim/spell/en.utf-8.add";
    };

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

        { name = "olets/zsh-abbr"; }

        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  home.file.".config/zsh-abbr/user-abbreviations".text = ''
    abbr dea="direnv allow"
    abbr dee="direnv edit"
    abbr cs="create-script"
    abbr daily="run create-daily next"
    abbr switch="run nixos nixedo switch"
    abbr sz="source ~/.config/zsh/.zshrc"

    abbr g="git"
    abbr ga="git add"
    abbr gap="git add -p"
    abbr gc="git commit"
    abbr gri="git rebase -i"
    abbr gs="git status

    # tmux
    abbr ta="tmux attach"
    abbr tl="tmux list-sessions"
    abbr tk="tmux kill-session"

    # Docker and Docker Compose.
    abbr dk="docker"
    abbr dkp="docker ps"
    abbr dkpa="docker ps -a"
    abbr dkpaq="docker ps -a -q"
    abbr dkb="docker build -t"
    abbr dks="docker start"
    abbr dkt="docker stop"
    abbr dkrm="docker rm"
    abbr dkri="docker rmi"
    abbr dke="docker exec -ti"
    abbr dkl="docker logs -f"
    abbr dki="docker images"
    abbr dkpu="docker pull"
    abbr dkph="docker push"
    abbr dkbnc="docker build --no-cache -t"
    abbr dkr="docker run --rm"
    abbr dkrti="docker run --rm -ti"
    abbr dkc="docker compose"
    abbr dkcb="docker compose build"
    abbr dkcu="docker compose up"
    abbr dkclean="docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi"

    # run scripts.
    abbr r="run"
    abbr rc="run composer"
    abbr rd="run drush"
    abbr rdcr="run drush cr"
    abbr rdup="run drush updb -y"
    abbr rdce="run drush config:export -y"
    abbr rdci="run drush config:import -y"
    abbr rduli="run drush uli"

    abbr -g A1="| awk '{print $1}'"
    abbr -g Fj="| jq ."
    abbr -g Fy="| yq ."
    abbr -g G="| grep"
    abbr -g GH="| grep HTTP"
    abbr -g Gi="| grep -i"
    abbr -g H2="| head -n 20"
    abbr -g H="| head"
    abbr -g L="| less"
    abbr -g V="| vim -"
    abbr -g X="| xargs -I1"
  '';
}
