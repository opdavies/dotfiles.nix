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

  programs.git = {
    enable = true;
    userName = "Oliver Davies";
    userEmail = "oliver@oliverdavies.uk";

    aliases = {
      b = "branch";
      cm = "commit";
    };
  };

  programs.tmux = {
    enable = true;

    extraConfig = ''
      unbind C-b

      set -g prefix C-s
      bind C-s send-prefix

      bind-key -n C-h select-pane -L
      bind-key -n C-j select-pane -D
      bind-key -n C-k select-pane -U
      bind-key -n C-l select-pane -R

      set-option -g status-keys "emacs"
      set-option -g default-terminal "xterm-256color"
      set-option -ga terminal-overrides ",*256col*:Tc"

      bind-key h split-window -v  -c '#{pane_current_path}'
      bind-key v split-window -h  -c '#{pane_current_path}'

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

      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l

      # Allow clearing screen with ctrl-l by using <prefix> C-l
      bind C-l send-keys 'C-l'
      bind C-k send-keys 'C-k'

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

    initExtra = ''
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
