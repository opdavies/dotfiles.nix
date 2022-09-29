{ config, pkgs, lib, libs, ... }:
{
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
      set-option -g default-terminal "screen-256color"

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
}
