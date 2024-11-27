{ pkgs }:

{
  name = "t";

  runtimeInputs = with pkgs; [
    openssl
    tmux
  ];

  text = ''
    # Based on similar scripts by ThePrimeagen and Jess Archer.

    if [[ $# -eq 1 ]]; then
      selected_path=$1
    else
      # Get the session name from fuzzy-finding list of directories and generating a
      # tmux-safe version.
      items=$(find "$REPOS" "$REPOS/personal" "$REPOS/os" ~/Documents \
        -maxdepth 1 -mindepth 1 -type d \
        ! -name "_archive" \
        ! -name "*-old" \
        ! -name "*.old"
      )

      selected_path=$(echo "''${items}" | sort | fzf)
    fi

    session_name=$(basename "$selected_path" | sed 's/\./_/g')

    if tmux switch-client -t="$session_name" 2>/dev/null; then
      exit 0
    fi

    ( (tmux new-session -c "$selected_path" -d -s "$session_name" && tmux switch-client -t "$session_name") 2>/dev/null ) ||
      tmux new-session -c "$selected_path" -A -s "$session_name"
  '';
}
