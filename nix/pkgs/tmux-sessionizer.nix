{ pkgs }:

pkgs.writeShellApplication {
  name = "tmux-sessionizer";

  runtimeInputs = with pkgs; [ tmux ];

  text = ''
    set +o nounset

    # Based on https://github.com/ThePrimeagen/tmux-sessionizer.

    switch_to() {
      if [[ -z $TMUX ]]; then
        tmux attach-session -t "$1"
      else
        tmux switch-client -t "$1"
      fi
    }

    has_session() {
      tmux list-sessions | grep -q "^$1:"
    }

    hydrate() {
      if [ -f "$2/.tmux" ]; then
        tmux send-keys -t "$1" "source $2/.tmux" Enter
      elif [ -f "$2/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $2/.tmux-sessionizer" Enter
      elif [ -f "$HOME/.tmux-sessionizer" ]; then
        tmux send-keys -t "$1" "source $HOME/.tmux-sessionizer" Enter
      fi
    }

    if [[ $# -eq 1 ]]; then
      selected=$1
    else
      selected=$(find ~/ ~/Code ~/Code/personal ~/Code/os ~/Documents -mindepth 1 -maxdepth 1 -type d ! -name "*.old" | fzf)
    fi

    if [[ -z "$selected" ]]; then
      exit 0
    fi

    selected_name="$(basename "$selected" | tr . _)"
    tmux_running="$(pgrep tmux)"

    if [[ -z $TMUX ]] && [[ -z "$tmux_running" ]]; then
      tmux new-session -s "$selected_name" -c "$selected"
      hydrate "$selected_name" "$selected"
      exit 0
    fi

    if ! has_session "$selected_name"; then
      tmux new-session -ds "$selected_name" -c "$selected"
      hydrate "$selected_name" "$selected"
    fi

    switch_to "$selected_name"
  '';
}
