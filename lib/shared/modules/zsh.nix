{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    initExtra = ''
      # Based on https://github.com/rwxrob/dot/blob/f4240010a82609da352b203103ab548f213a4328/.bashrc#L313.
      clone() {
        repo_url="$1"

        # Extract the remote domain (e.g. github.com) from the repo URL.
        domain="''${repo_url#*://}"
        if [[ "''${domain}" == *@*:* ]]; then
            # SSH repo URL: domain ends at the colon.
            domain="''${domain#*@}"
            domain="''${domain%%:*}"
        else
            # HTTPS repo URL: domain ends at the slash.
            domain="''${domain%%/*}"
        fi

        # TODO: make it work with multi-level URLS - e.g. https://gitlab.com/a/b/c/d.git

        user_and_repo_name="''${repo_url}"
        user_and_repo_name="''${user_and_repo_name#git@bitbucket.org:}"
        user_and_repo_name="''${user_and_repo_name#git@github.com:}"
        user_and_repo_name="''${user_and_repo_name#git@gitlab.com:}"
        user_and_repo_name="''${user_and_repo_name#https://bitbucket.org/}"
        user_and_repo_name="''${user_and_repo_name#https://github.com/}"
        user_and_repo_name="''${user_and_repo_name#https://gitlab.com/}"

        if [[ "''${user_and_repo_name}" =~ / ]]; then
          user="''${user_and_repo_name%%/*}"
        else
          user="$GITUSER"
          [[ -z "$user" ]] && user="$USER"
        fi

        repo_name="''${user_and_repo_name##*/}"
        repo_name="''${repo_name%.git}"

        user_path="''${REPOS}/''${domain}/''${user}"

        repo_path="''${user_path}/''${repo_name}"

        [[ -d "''${repo_path}" ]] && t "''${repo_path}" && return

        ${pkgs.coreutils}/bin/mkdir -p "''${user_path}"
        pushd "''${user_path}"

        echo ${pkgs.git}/bin/git clone "''${repo_url}" "''${repo_name}"
        ${pkgs.git}/bin/git clone "''${repo_url}" "''${repo_name}"

        popd
        t "''${repo_path}"
      }

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

      # auto-completes aliases
      # enables to define
      # - normal aliases (completed with trailing space)
      # - blank aliases (completed without space)
      # - ignored aliases (not completed)

      # ignored aliases
      typeset -a ialiases
      ialiases=()

      ialias() {
        alias $@
        args="$@"
        args=''${args%%\=*}
        ialiases+=(''${args##* })
      }

      # blank aliases
      typeset -a baliases
      baliases=()

      balias() {
        alias $@
        args="$@"
        args=''${args%%\=*}
        baliases+=(''${args##* })
      }

      expand-alias-space() {
        [[ $LBUFFER =~ "\<(''${(j:|:)baliases})\$" ]]; insertBlank=$?
        if [[ ! $LBUFFER =~ "\<(''${(j:|:)ialiases})\$" ]]; then
          zle _expand_alias
        fi

        zle self-insert

        if [[ "$insertBlank" = "0" ]]; then
          zle backward-delete-char
        fi
      }

      zle -N expand-alias-space

      bindkey " " expand-alias-space
      bindkey -M isearch " " magic-space

      alias dea='direnv allow'
      alias dee='direnv edit'

      ialias cat="bat"
      ialias cs="create-script"
      ialias daily="run create-daily next"
      ialias ls="lsd"
      ialias run="./run"
      ialias s="secrets"
      ialias secrets="doppler --project \"$(whoami)\" run"
      ialias switch="run nixos nixedo switch"
      ialias sz="source ~/.config/zsh/.zshrc"
      ialias tag="tag-release"
      ialias uncommit="git reset --soft HEAD^";
      ialias wt="git worktree"
      ialias vss="LC_ALL=C sort --unique ~/Code/personal/opdavies.nvim/spell/en.utf-8.add --output ~/Code/personal/opdavies.nvim/spell/en.utf-8.add"
      balias lh3="xdg-open http://localhost:3000"
      balias lh8="xdg-open http://localhost:8000"

      # tmux
      alias ta="tmux attach"
      alias tl="tmux list-sessions"
      alias tk="tmux kill-session"

      # Docker and Docker Compose.
      alias dk="docker"
      alias dkp="docker ps"
      alias dkpa="docker ps -a"
      alias dkpaq="docker ps -a -q"
      alias dkb="docker build -t"
      alias dks="docker start"
      alias dkt="docker stop"
      alias dkrm="docker rm"
      alias dkri="docker rmi"
      alias dke="docker exec -ti"
      alias dkl="docker logs -f"
      alias dki="docker images"
      alias dkpu="docker pull"
      alias dkph="docker push"
      alias dkbnc="docker build --no-cache -t"
      alias dkr="docker run --rm"
      alias dkrti="docker run --rm -ti"
      alias dkc="docker compose"
      alias dkcb="docker compose build"
      alias dkcu="docker compose up"
      alias dkclean="docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi"

      # Nix and NixOS.
      alias nx="nix"
      alias nxb="nix build --json --no-link --print-build-logs"
      alias nxd="nix develop"
      alias nxf="nix flake"
      alias nxfu="nix flake update"
      alias nxs="nix shell"
      ialias full-system-clean='nix-collect-garbage -d && sudo nix-collect-garbage -d'
      ialias full-system-repair='nix-store --verify --check-contents --repair'
      ialias full-system-upgrade="sudo nixos-rebuild switch --upgrade && nix-env -u '*'"
      ialias list-system-configurations='\ls -l /nix/var/nix/profiles/system-*-link'
      ialias local-upgrade="nix-channel --update nixpkgs && nix-env -u '*'"
      ialias set-default-boot='/run/current-system/bin/switch-to-configuration boot'
      ialias system-rebuild='sudo nixos-rebuild switch'
      ialias system-repair='sudo nixos-rebuild switch --repair'
      ialias system-upgrade-information='sudo nixos-rebuild switch --upgrade dry-build'

      alias tf="terraform"

      # run scripts.
      alias r="run"
      alias rc="run composer"
      alias rd="run drush"
      alias rdcr="run drush cr"
      alias rdup="run drush updb -y"
      alias rdce="run drush config:export -y"
      alias rdci="run drush config:import -y"
      alias rduli="run drush uli"

      alias -g A1="| awk '{print \$1}'"
      alias -g Fj='| jq .'
      alias -g Fy='| yq .'
      alias -g G='| grep'
      alias -g GH='| grep HTTP'
      alias -g Gi='| grep -i'
      alias -g H2='| head -n 20'
      alias -g H='| head'
      alias -g L='| less'
      alias -g V='| vim -'
      alias -g X='| xargs -I1'

      setopt auto_cd
      setopt auto_pushd
      setopt pushd_ignore_dups
      setopt pushdminus
    '';

    zplug = {
      enable = true;

      plugins = [
        {
          name = "themes/robbyrussell";
          tags = [ "from:oh-my-zsh" "as:theme" ];
        }
        {
          name = "plugin/git";
          tags = [ "from:oh-my-zsh" ];
        }
        {
          name = "plugin/vi-mode";
          tags = [ "from:oh-my-zsh" ];
        }
        { name = "joshskidmore/zsh-fzf-history-search"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };
}
