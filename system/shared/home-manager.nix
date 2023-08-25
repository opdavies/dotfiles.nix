{ inputs, pkgs, self, username }:

let
  customVim = with self; {
    vim-astro = pkgs.vimUtils.buildVimPlugin {
      name = "vim-astro";
      src = pkgs.fetchFromGitHub {
        owner = "wuelnerdotexe";
        repo = "vim-astro";
        rev = "main";
        sha256 = "HyQ4i/T1uQmGurBqCpo8+ESVSVPsTrLQBxLe2OEYjcY=";
      };
    };

    vim-heritage = pkgs.vimUtils.buildVimPlugin {
      name = "vim-heritage";
      src = pkgs.fetchFromGitHub {
        owner = "jessarcher";
        repo = "vim-heritage";
        rev = "cffa05c78c0991c998adc4504d761b3068547db6";
        sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
      };
    };

    vim-just = pkgs.vimUtils.buildVimPlugin {
      name = "vim-just";
      src = pkgs.fetchFromGitHub {
        owner = "NoahTheDuke";
        repo = "vim-just";
        rev = "838c9096d4c5d64d1000a6442a358746324c2123";
        sha256 = "DSC47z2wOEXvo2kGO5JtmR3hyHPiYXrkX7MgtagV5h4=";
      };
    };

    vim-textobj-xmlattr = pkgs.vimUtils.buildVimPlugin {
      name = "vim-textobj-xmlattr";
      src = pkgs.fetchFromGitHub {
        owner = "whatyouhide";
        repo = "vim-textobj-xmlattr";
        rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
        sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
      };
    };

    tabline-vim = pkgs.vimUtils.buildVimPlugin {
      name = "tabline-vim";
      src = pkgs.fetchFromGitHub {
        owner = "mkitt";
        repo = "tabline.vim";
        rev = "69c9698a3240860adaba93615f44778a9ab724b4";
        sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
      };
    };

    vim-caser = pkgs.vimUtils.buildVimPlugin {
      name = "vim-caser";
      src = pkgs.fetchFromGitHub {
        owner = "arthurxavierx";
        repo = "vim-caser";
        rev = "master";
        sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
      };
    };

    vim-visual-star-search = pkgs.vimUtils.buildVimPlugin {
      name = "vim-visual-star-search";
      src = pkgs.fetchFromGitHub {
        owner = "nelstrom";
        repo = "vim-visual-star-search";
        rev = "37259722f45996733fd309add61385a4ad88bdb9";
        sha256 = "n8jd6fy30XukZ9NFZX5qclSlMfziP/Ew9dXfkysRl4Y=";
      };
    };

    vim-zoom = pkgs.vimUtils.buildVimPlugin {
      name = "vim-zoom";
      src = pkgs.fetchFromGitHub {
        owner = "dhruvasagar";
        repo = "vim-zoom";
        rev = "01c737005312c09e0449d6518decf8cedfee32c7";
        sha256 = "/ADzScsG0u6RJbEtfO23Gup2NYdhPkExqqOPVcQa7aQ=";
      };
    };
  };
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.file.".gitmessage".text = ''
    type(scope): description

    # type: fix, feat, build, chore, ci, docs, style, refactor, perf, test
    #
    # Description
    #
    # - Why is this change necessary?
    # - How does it address the issue?
    # - What side effects does this change have?
    #
    # For breaking changes, add an ! after the type/scope, uncomment the following
    # line and describe the change:
    #
    # BREAKING CHANGE:
  '';

  home.file.".gitignore-global".text = ''
    .phpactor.json
  '';

  home.file."nodemon.json".text = ''
    {
      "ignore": [
        ".git"
      ],
      "verbose": true,
      "events": {
        "start": "clear"
      }
    }
  '';

  programs.bat.enable = true;

  programs.git = {
    enable = true;
    userName = "Oliver Davies";
    userEmail = "oliver@oliverdavies.uk";

    aliases = {
      aa = "add --all";
      assume = "update-index --assume-unchanged";
      assumed = "!git ls-files -v | grep '^[hsmrck?]' | cut -c 3-";
      b = "branch";
      browse = "!gh repo view --web";
      ca = "commit --amend --verbose";
      car = "commit --amend --no-edit";
      cl = "!hub clone";
      co = "checkout";
      compare = "!hub compare";
      current-branch = "rev-parse --abbrev-ref HEAD";
      dc = "diff --color --word-diff --cached";
      df = "diff --color --word-diff";
      dup =
        "!git checkout develop && git fetch origin && echo && git sl develop..origin/develop && echo && git pull --quiet && git checkout -";
      fixup = "commit --fixup";
      issues = "!gh issue list --web";
      mup =
        "!git master-to-main-wrapper checkout %BRANCH% && git fetch origin && echo && git sl %BRANCH%..origin/%BRANCH% && echo && git pull --quiet && git checkout -";
      nah = "!git reset --hard && git clean -fd";
      no-ff = "merge --no-ff";
      pl = "pull";
      prune = "remote prune origin";
      ps = "push";
      pulls = "!gh pr list --web";
      rbc = "rebase --continue";
      rdup = "!git dup && git rebase develop";
      remotes = "remote -v";
      repush = "!git pull --rebase && git push";
      ri = "rebase --interactive";
      rid = "!git rebase -i $(git merge-base develop HEAD)";
      rim =
        "!git rebase -i $(git master-to-main-wrapper merge-base %BRANCH% HEAD)";
      rip = "!git rebase -i $(git merge-base production HEAD)";
      ris = "!git rebase -i $(git merge-base staging HEAD)";
      riu =
        "!git rebase -i $(git rev-parse --abbrev-ref --symbolic-full-name @{u})";
      rmup = "!git mup && git master-to-main-wrapper rebase %BRANCH%";
      sl = "log --oneline --decorate -20";
      sla = "log --oneline --decorate --graph --all -20";
      slap = "log --oneline --decorate --graph --all";
      slp = "log --oneline --decorate";
      staged = "diff --staged";
      unassume = "update-index --no-assume-unchanged";
      uncommit = "reset --soft HEAD^";
      unstage = "reset";
      upstream = "rev-parse --abbrev-ref --symbolic-full-name @{u}";
      ureset = "!git reset --hard $(git upstream)";
      wip = "!git add . && git commit -m 'wip'";
      worktrees = "worktree list";
    };

    extraConfig = {
      branch = {
        autosetupmerge = true;
        autosetuprebase = "always";
      };
      checkout.defaultRemote = "origin";
      color.ui = true;
      commit = { template = "~/.gitmessage"; };
      core = {
        editor = "nvim";
        excludesFile = "~/.gitignore-global";
        pager = "delta";
      };
      delta.line-numbers = true;
      diff.tool = "vimdiff";
      fetch.prune = true;
      grep.lineNumber = true;
      help.autocorrect = "1";
      init = {
        defaultBranch = "main";
        templatedir = "~/.git_template";
      };
      merge.ff = "only";
      rebase = {
        autosquash = true;
        autostash = true;
      };
      push.default = "upstream";
      pull = {
        ff = "only";
        rebase = true;
      };
    };
  };

  home.file."logo.txt" = {
    source = pkgs.copyPathToStore "${self}/logo.txt";
    target = "logo.txt";
  };

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

      ialias cs="create-script"
      ialias dev="develop"
      ialias fetch="git fetch --all --jobs=4 --progress --prune"
      ialias run="./run"
      ialias pull="git pull --autostash --jobs=4 --summary origin"
      ialias rebase="git rebase --autostash --stat"
      ialias run="./run"
      ialias s="secrets"
      ialias secrets="doppler --project \"$(whoami)\" run"
      ialias tag="tag-release"
      ialias update="fetch && rebase"

      ialias ls="exa -la"

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

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";

    extraConfig = ''
      unbind C-b

      set -g prefix C-s
      bind C-s send-prefix

      bind-key -n C-h select-pane -L
      bind-key -n C-j select-pane -D
      bind-key -n C-k select-pane -U
      bind-key -n C-l select-pane -R

      set-option -g status-keys "emacs"
      set-option -ga terminal-overrides ",*256col*:alacritty"

      bind-key h split-window -v  -c "#{pane_current_path}"
      bind-key v split-window -h  -c "#{pane_current_path}"

      bind -n S-Left resize-pane -L 2
      bind -n S-Right resize-pane -R 2
      bind -n S-Down resize-pane -D 1
      bind -n S-Up resize-pane -U 1

      bind -n C-Left resize-pane -L 10
      bind -n C-Right resize-pane -R 10
      bind -n C-Down resize-pane -D 5
      bind -n C-Up resize-pane -U 5

      # Status line customisation
      set-option -g status-left-length 100
      set-option -g status-right-length 100
      set-option -g status-left " #{session_name}  "
      set-option -g status-right "#{pane_title} "
      set-option -g status-style "fg=#7C7D83 bg=#242631"
      set-option -g window-status-format "#{window_index}:#{pane_current_command}#{window_flags} "
      set-option -g window-status-current-format "#{window_index}:#{pane_current_command}#{window_flags} "
      set-option -g window-status-current-style "fg=#E9E9EA"
      set-option -g window-status-activity-style none

      bind c new-window -c "#{pane_current_path}"

      set -g base-index 1
      set -g renumber-windows on

      # Break a pane into a new window.
      bind-key b break-pane -d
      bind-key J command-prompt -p "join pane from: "  "join-pane -h -s '%%'"

      bind-key C-j choose-tree

      # Use vim keybindings in copy mode
      setw -g mode-keys vi

      # Setup 'v' to begin selection as in Vim
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-pipe "reattach-to-user-namespace pbcopy"

      bind C-j split-window -v "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t"

      bind-key K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

      # Allow clearing screen with ctrl-l by using <prefix> C-l
      bind C-l send-keys "C-l"
      bind C-k send-keys "C-k"

      # Enable mouse support.
      setw -g mouse on

      # Remove delay when switching Vim modes.
      set -sg escape-time 0

      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      bind-key -r F new-window t
      bind-key -r D run-shell "t ~/Code/github.com/opdavies/dotfiles"

      set -g @resurrect-strategy-nvim 'session'
    '';

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
  };

  programs.neovim = {
    enable = true;

    plugins = with pkgs; [
      customVim.tabline-vim
      customVim.vim-astro
      customVim.vim-caser
      customVim.vim-heritage
      customVim.vim-just
      customVim.vim-zoom
      customVim.vim-textobj-xmlattr
      customVim.vim-visual-star-search

      vimPlugins.comment-nvim
      vimPlugins.dial-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
      vimPlugins.indent-blankline-nvim
      vimPlugins.nvim-web-devicons
      vimPlugins.refactoring-nvim
      vimPlugins.rest-nvim
      vimPlugins.splitjoin-vim
      vimPlugins.undotree
      vimPlugins.vim-easy-align
      vimPlugins.vim-eunuch
      vimPlugins.vim-highlightedyank
      vimPlugins.vim-nix
      vimPlugins.vim-obsession
      vimPlugins.vim-pasta
      vimPlugins.vim-polyglot
      vimPlugins.vim-repeat
      vimPlugins.vim-sleuth
      vimPlugins.vim-sort-motion
      vimPlugins.vim-surround
      vimPlugins.vim-terraform
      vimPlugins.vim-test
      vimPlugins.vim-textobj-user
      vimPlugins.vim-tmux-navigator
      vimPlugins.vim-unimpaired

      # Git
      vimPlugins.vim-fugitive
      vimPlugins.vim-rhubarb

      # Debugging
      vimPlugins.nvim-dap
      vimPlugins.nvim-dap-ui
      vimPlugins.nvim-dap-virtual-text

      # Treesitter
      vimPlugins.nvim-treesitter.withAllGrammars
      vimPlugins.nvim-treesitter-context
      vimPlugins.nvim-treesitter-textobjects

      # LSP
      inputs.nixpkgs-unstable.legacyPackages."${system}".vimPlugins.lsp-zero-nvim
      inputs.nixpkgs-unstable.legacyPackages."${system}".vimPlugins.nvim-lspconfig
      vimPlugins.null-ls-nvim
      vimPlugins.lsp-status-nvim

      # Completion
      vimPlugins.cmp-buffer
      vimPlugins.cmp-cmdline
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-nvim-lsp-signature-help
      vimPlugins.cmp-path
      vimPlugins.cmp-tabnine
      vimPlugins.cmp-treesitter
      vimPlugins.cmp-vsnip
      vimPlugins.cmp_luasnip
      vimPlugins.lspkind-nvim
      vimPlugins.nvim-cmp
      vimPlugins.phpactor

      # Snippets
      vimPlugins.luasnip

      # Telescope
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim
      vimPlugins.telescope-file-browser-nvim
      vimPlugins.telescope-frecency-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-live-grep-args-nvim
      vimPlugins.telescope-nvim
      vimPlugins.telescope-ui-select-nvim

      # Databases
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion

      # Themes
      vimPlugins.catppuccin-nvim

      inputs.self.packages.${pkgs.system}.opdavies-nvim
    ];

    extraConfig = ''
      lua << EOF
        pcall("require", impatient)

        require "opdavies.globals"

        require("opdavies.options").setup()

        require "opdavies.lsp"

        require "opdavies.telescope.setup"
        require "opdavies.telescope.mappings"
      EOF
    '';

    extraPackages = with pkgs; [
      # Languages
      nodePackages.typescript

      # Language servers
      ansible-language-server
      inputs.nixpkgs-unstable.legacyPackages."${system}".nixd
      lua53Packages.lua-lsp
      nodePackages.intelephense
      nodePackages."@astrojs/language-server"
      nodePackages."@tailwindcss/language-server"
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.typescript-language-server
      nodePackages.vls
      nodePackages.volar
      nodePackages.vscode-langservers-extracted
      nodePackages.vue-language-server
      nodePackages.yaml-language-server
      phpactor
      rnix-lsp
      terraform-ls

      # Formatters
      black
      rstfmt

      # Tools
      html-tidy
      nodePackages.markdownlint-cli
      proselint
      shellcheck
    ];
  };
  programs.nnn.enable = true;

  home.sessionPath = [ "$HOME/.config/bin" ];

  xdg.configFile."ripgrep/config".text = ''
    --follow
    --smart-case
  '';

  xdg.configFile.bin = {
    source = ../../bin;
    recursive = true;
  };

  xdg.configFile.phpactor = {
    source = ../../config/phpactor;
    recursive = true;
  };
}
