{ pkgs, ... }:
let
  inherit (pkgs) tmuxPlugins;
in
{
  programs.tmux = {
    enable = true;

    tmuxinator.enable = true;

    terminal = "xterm-256color";

    extraConfig = ''
      unbind C-b

      set -g prefix C-s
      bind C-s send-prefix

      bind-key -n C-h select-pane -L
      bind-key -n C-j select-pane -D
      bind-key -n C-k select-pane -U
      bind-key -n C-l select-pane -R

      set-option -g status-keys "emacs"
      set-option -sa terminal-features "''${TERM}:RGB"

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
      set-option -g status-left " "
      set-option -g status-right " #{session_name} "
      set-option -g status-right-length 100
      set-option -g status-style "fg=#7C7D83 bg=#242631"
      set-option -g window-status-activity-style none
      set-option -g window-status-current-format "#{window_index}:#{pane_current_command}#{window_flags} "
      set-option -g window-status-current-style "fg=#E9E9EA"
      set-option -g window-status-format "#{window_index}:#{pane_current_command}#{window_flags} "

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
      bind-key -T copy-mode-vi 'y' send -X copy-pipe wl-copy

      bind C-j split-window -v "tmux list-sessions | sed -E 's/:.*$//' | grep -v \"^$(tmux display-message -p '#S')\$\" | fzf --reverse | xargs tmux switch-client -t"

      bind-key K run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'

      # Allow clearing screen with ctrl-l by using <prefix> C-l
      bind C-l send-keys "C-l"
      bind C-k send-keys "C-k"

      # Enable mouse support.
      setw -g mouse on

      # Remove delay when switching Vim modes.
      set -sg escape-time 0

      set-option -g pane-active-border-style "fg=#1f2335"
      set-option -g pane-border-style "fg=#1f2335"

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
      bind-key -r D run-shell "t ~/Code/github.com/opdavies/dotfiles.nix"
      bind-key -r N run-shell "t ~/Code/github.com/opdavies/opdavies.nvim"
      bind-key -r W run-shell "t ~/Documents/wiki"

      set -g @resurrect-strategy-nvim 'session'

      if-shell "[ -f ~/.tmux.conf.local ]" 'source ~/.tmux.conf.local'
    '';

    plugins = [
      tmuxPlugins.resurrect
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
  };
}
