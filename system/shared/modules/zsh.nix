{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

    initExtra = ''
      # Plugins
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh"
      source "''${ZPLUG_REPOS}/robbyrussell/oh-my-zsh/plugins/vi-mode/vi-mode.plugin.zsh"

      # Case insensitive autocompletion.
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"
      autoload -Uz compinit && compinit

      bindkey -s ^f "t\n"

      clear-ls-all() {
        clear
        exa -al
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

      ialias cs="create-script"
      ialias daily="run create-daily next"
      ialias fetch="git fetch --all --jobs=4 --progress --prune"
      ialias ls="exa -la"
      ialias nah="git reset --hard; git clean -fd"
      ialias pull="git pull --autostash --jobs=4 --summary origin"
      ialias rebase="git rebase --autostash --stat"
      ialias run="./run"
      ialias s="secrets"
      ialias secrets="doppler --project \"$(whoami)\" run"
      ialias switch="run nixos nixedo switch"
      ialias sz="source ~/.config/zsh/.zshrc"
      ialias tag="tag-release"
      ialias uncommit="git reset --soft HEAD^";
      ialias update="fetch && rebase"
      ialias wip="git add . && git commit -m 'wip'";
      ialias wt="git worktree"

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

      alias tf="terraform"

      # Build Configs.
      ialias build-configs="~/Code/Personal/build-configs/bin/build-configs run"
      ialias update-build-configs="~/Code/Personal/build-configs-updater/update.sh"

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
        { name = "mollifier/cd-gitroot"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };
}
