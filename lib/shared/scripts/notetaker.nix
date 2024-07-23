{
  name = "notetaker";

  runtimeInputs = [ ];

  text = ''
    # Based on https://github.com/CalinLeafshade/dots/blob/fe685d45201f267829b75fe5ca7e3da9d4aa4c02/bin/bin/notetaker.

    today="$(date +%Y-%m-%d)"
    note_path="''${NOTES_PATH:-$HOME/Documents/wiki}"
    note_filename="$note_path/daily-notes/$(date +%Y)/$(date +%m)/$today.md"

    if [[ ! -f "$note_filename" ]]; then
      mkdir -p "$(dirname "$note_filename")"

      echo "# $today" > "$note_filename"
    fi

    nvim -c "normal Go" \
      -c "normal Go## $(date +%H:%M)" \
      -c "normal G2o" \
      -c "normal zz" \
      -c "startinsert" "$note_filename"
  '';
}
