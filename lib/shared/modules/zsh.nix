{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    shellAliases = {
      dea = "direnv allow";
      dee = "direnv edit";
      cat = "bat";
      cs = "create-script";
      daily = "run create-daily next";
      ls = "lsd";
      run = "./run";
      s = "secrets";
      secrets = ''doppler --project "$(whoami)" run'';
      switch = "run nixos nixedo switch";
      sz = "source ~/.config/zsh/.zshrc";
      tag = "tag-release";
      wt = "git worktree";
      vss = "LC_ALL=C sort --unique ~/Code/personal/opdavies.nvim/spell/en.utf-8.add --output ~/Code/personal/opdavies.nvim/spell/en.utf-8.add";

      # tmux
      ta = "tmux attach";
      tl = "tmux list-sessions";
      tk = "tmux kill-session";

      # Docker and Docker Compose.
      dk = "docker";
      dkp = "docker ps";
      dkpa = "docker ps -a";
      dkpaq = "docker ps -a -q";
      dkb = "docker build -t";
      dks = "docker start";
      dkt = "docker stop";
      dkrm = "docker rm";
      dkri = "docker rmi";
      dke = "docker exec -ti";
      dkl = "docker logs -f";
      dki = "docker images";
      dkpu = "docker pull";
      dkph = "docker push";
      dkbnc = "docker build --no-cache -t";
      dkr = "docker run --rm";
      dkrti = "docker run --rm -ti";
      dkc = "docker compose";
      dkcb = "docker compose build";
      dkcu = "docker compose up";
      dkclean = "docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi";

      # run scripts.
      r = "run";
      rc = "run composer";
      rd = "run drush";
      rdcr = "run drush cr";
      rdup = "run drush updb -y";
      rdce = "run drush config:export -y";
      rdci = "run drush config:import -y";
      rduli = "run drush uli";
    };

    shellGlobalAliases = {
      A1 = "| awk '{print $1}'";
      Fj = "| jq .";
      Fy = "| yq .";
      G = "| grep";
      GH = "| grep HTTP";
      Gi = "| grep -i";
      H2 = "| head -n 20";
      H = "| head";
      L = "| less";
      V = "| vim -";
      X = "| xargs -I1";
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
      source "''${ZPLUG_REPOS}/MenkeTechnologies/zsh-expand/zsh-expand.plugin.zsh"
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

        { name = "MenkeTechnologies/zsh-expand"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  programs.zsh.localVariables = {
    ZPWR_EXPAND = true;
    ZPWR_EXPAND_BLACKLIST = [
      "cat"
      "cs"
      "daily"
      "full-system-clean"
      "full-system-repair"
      "full-system-upgrade"
      "list-system-configurations"
      "set-default-boot"
      "system-rebuld"
      "system-repair"
      "system-upgrade-information"
      "ls"
      "run"
      "s"
      "secrets"
      "sz"
      "tag"
      "vss"
      "wt"
    ];
    ZPWR_EXPAND_NATIVE = true;
    ZPWR_EXPAND_SECOND_POSITION = true;
  };
}
