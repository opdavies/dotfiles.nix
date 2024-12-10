{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  inherit (pkgs) tmuxPlugins;
in
{
  options.features.cli.tmux.enable = mkEnableOption "Enable tmux";

  config = mkIf config.features.cli.tmux.enable {
    programs.tmux = {
      enable = true;

      terminal = "tmux-256color";

      extraConfig = ''
        set-option -g status-keys "vi"
        set-option -sa terminal-features "''${TERM}:RGB"

        bind -n S-Left resize-pane -L 2
        bind -n S-Right resize-pane -R 2
        bind -n S-Down resize-pane -D 1
        bind -n S-Up resize-pane -U 1

        bind -n C-Left resize-pane -L 10
        bind -n C-Right resize-pane -R 10
        bind -n C-Down resize-pane -D 5
        bind -n C-Up resize-pane -U 5

        # Status line customisation
        set-option -g status-left ""
        set-option -g status-right " #{session_name}"
        set-option -g status-right-length 100
        set-option -g status-style "fg=#7C7D83 bg=default"
        set-option -g window-status-activity-style none
        set-option -g window-status-current-style "fg=#E9E9EA"

        bind c new-window -c "#{pane_current_path}"

        set -g base-index 1
        set -g pane-base-index 1
        set -g renumber-windows on

        # Break a pane into a new window.
        bind-key b break-pane -d
        bind-key J command-prompt -p "join pane from: "  "join-pane -h -s '%%'"

        bind-key C-j choose-tree

        set-window-option -g mode-keys vi
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

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

        bind-key -r f run-shell "tmux new-window custom-tmux-sessionizer"

        if-shell "[ -f ~/.tmux.conf.local ]" 'source ~/.tmux.conf.local'
      '';

      plugins = [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.yank
      ];
    };
  };
}
