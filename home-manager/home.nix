{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
      dup = "!git checkout develop && git fetch origin && echo && git sl develop..origin/develop && echo && git pull --quiet && git checkout -";
      fixup = "commit --fixup";
      issues = "!gh issue list --web";
      mup = "!git master-to-main-wrapper checkout %BRANCH% && git fetch origin && echo && git sl %BRANCH%..origin/%BRANCH% && echo && git pull --quiet && git checkout -";
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
      rim = "!git rebase -i $(git master-to-main-wrapper merge-base %BRANCH% HEAD)";
      rip = "!git rebase -i $(git merge-base production HEAD)";
      ris = "!git rebase -i $(git merge-base staging HEAD)";
      riu = "!git rebase -i $(git rev-parse --abbrev-ref --symbolic-full-name @{u})";
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
      commit = {
        template = "~/.gitmessage";
        verbose = true;
      };
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
      init.templatedir = "~/.git_template";
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
      set-option -ga terminal-overrides ",*256col*:Tc"
      set-option -g default-terminal "xterm-256color"

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

      set-option -g status-left-length 50
      set-option -g status-right ""

      bind c new-window -c "#{pane_current_path}"

      set -g base-index 1
      set -g renumber-windows on

      # Break a pane into a new window.
      bind-key b break-pane -d

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
    '';

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.yank
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = ".config/zsh";

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
