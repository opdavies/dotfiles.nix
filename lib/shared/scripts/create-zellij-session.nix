{ pkgs }:
{
  name = "create-zellij-session";

  runtimeInputs = with pkgs; [
    openssl
    zellij
  ];

  text = ''
    function _execute_zellij_layout {
      local session_name="$1"
      local layout_file="$2"

      DIGEST="$(openssl sha512 "$layout_file")"

      # Prompt the first time we see a given layout file before running it.
      if ! grep -q "$DIGEST" ~/..zellij.digests 2> /dev/null; then
        cat "$layout_file"

        read -r -n 1 -p "Trust (and run) this Zellij file? (t = trust, otherwise = skip) "

        if [[ $REPLY =~ ^[Tt]$ ]]; then
          echo "$DIGEST" >> ~/..zellij.digests

          _attach_to_or_create_zellij_session --layout "$layout_file"
        fi
      else
        _attach_to_or_create_zellij_session --layout "$layout_file"
      fi
    }

    function _attach_to_or_create_zellij_session {
      zellij attach "$session_name" 2>/dev/null || zellij --session "$session_name" "$@"
    }

    function main {
      if [[ $# -eq 1 ]]; then
        selected_path=$1
      else
        items=$(find "$REPOS" ~/Documents \
          -maxdepth 1 -mindepth 1 -type d \
          ! -name "*-old" \
          ! -name "*.bak" \
          ! -name "*.old" \
          ! -name "_archive"
        )

        selected_path=$(echo "''${items}" | sort | fzf --reverse)
      fi

      session_name=$(basename "$selected_path")

      cd "$selected_path"

      if [[ -f ".ignored/dev.kdl" ]]; then
        _execute_zellij_layout "$session_name" ".ignored/dev.kdl"
      elif [[ -f "dev.kdl" ]]; then
        _execute_zellij_layout "$session_name" "dev.kdl"
      fi

      _attach_to_or_create_zellij_session
    }

    main "$@"
  '';
}
