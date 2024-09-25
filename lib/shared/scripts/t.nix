{ pkgs }:

{
  name = "t";

  runtimeInputs = with pkgs; [
    openssl
    tmux
  ];

  text = ''
    # Credit to ThePrimeagen and Jess Archer.

    function execute_tmux_file {
      local tmux_file="$1"
      selected_path="$2"
      session_name="$3"

      DIGEST="$(openssl sha512 "$tmux_file")"

      # Prompt the first time we see a given .tmux file before running it.
      if ! grep -q "$DIGEST" ~/..tmux.digests 2> /dev/null; then
        cat "$tmux_file"

        read -r -n 1 -p "Trust (and run) this .tmux file? (t = trust, otherwise = skip) "

        if [[ $REPLY =~ ^[Tt]$ ]]; then
          echo "$DIGEST" >> ~/..tmux.digests

          create_session_and_run_tmux_file "$tmux_file" "$selected_path" "$session_name"
        fi
      else
        create_session_and_run_tmux_file "$tmux_file" "$selected_path" "$session_name"
      fi
    }

    function create_session_and_run_tmux_file {
      tmux_file="$1"
      selected_path="$2"
      session_name="$3"

      tmux new-session -d -c "$selected_path" -s "$session_name"
      (cd "$selected_path" && "$tmux_file" "$session_name")
    }

    function main {
      if [[ $# -eq 1 ]]; then
        selected_path=$1
      else
        # Get the session name from fuzzy-finding list of directories and generating a
        # tmux-safe version.
        items=$(find "$REPOS" ~/Documents \
          -maxdepth 1 -mindepth 1 -type d \
          ! -name "_archive" \
          ! -name "*-old" \
          ! -name "*.old"
        )

        selected_path=$(echo "''${items}" | sort | fzf --reverse)
      fi

      session_name=$(basename "$selected_path" | sed 's/\./_/g')

      # Attach to an existing session, if one exists.
      if tmux has-session -t "$session_name" 2> /dev/null; then
        tmux attach -t "$session_name" || tmux switch-client -t "$session_name"
        exit
      fi

      if [[ -x "$selected_path/.tmux" ]]; then
        execute_tmux_file "$selected_path/.tmux" "$selected_path" "$session_name"
      elif [[ -x "$selected_path/.ignored/.tmux" ]]; then
        execute_tmux_file "$selected_path/.ignored/.tmux" "$selected_path" "$session_name"
      fi

      # If there is no session, create one.
      if ! tmux has-session -t "$session_name" 2> /dev/null; then
        tmux new-session -d -c "$selected_path" -s "$session_name"
      fi

      tmux switch-client -t "$session_name" 2>/dev/null || tmux attach-session -t "$session_name"
    }

    main "$@"
  '';
}
