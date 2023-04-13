{ config, pkgs, lib, libs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    initExtra = ''
      # Make Caps Lock behave like Ctrl.
      setxkbmap -option ctrl:nocaps

      # Make short-pressed Ctrl behave like Escape.
      xcape -e 'Control_L=Escape'

      # Plugins
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh"
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh"

      # Case insensitive autocompletion.
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      autoload -Uz compinit && compinit

      clear-ls-all() {
        clear
        exa -al
      }
      zle -N clear-ls-all
      bindkey '^K' clear-ls-all

      clear-git-status() {
        clear
        git status -sb .
      }
      zle -N clear-git-status
      bindkey '^G' clear-git-status

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

      ialias fetch="git fetch --all --jobs=4 --progress --prune"
      ialias run="./run"
      ialias pull="git pull --autostash --jobs=4 --summary origin"
      ialias rebase="git rebase --autostash --stat"
      ialias update="fetch && rebase"

      # Nix and NixOS.
      alias nx="nix"
      alias nxb="nix build"
      alias nxd="nix develop"
      alias nxf="nix flake"
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

      setopt auto_cd
      setopt auto_pushd
      setopt pushd_ignore_dups
      setopt pushdminus
    '';

    zplug = {
      enable = true;

      plugins = [
        { name = "themes/robbyrussell"; tags = [from:oh-my-zsh as:theme]; }
        { name = "plugin/git"; tags = [from:oh-my-zsh]; }
        { name = "plugin/vi-mode"; tags = [from:oh-my-zsh]; }
        { name = "mollifier/cd-gitroot"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };
}
