_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

_not_inside_phpstorm() {
  if is_macos; then
    [[ "$TERM_PROGRAM" != "" ]]
  elif is_linux; then
    [[ "$TERMINAL_EMULATOR" != "JetBrains"* ]]
  fi
}

ensure_tmux_is_running() {
  if _not_inside_tmux && _not_inside_phpstorm; then
    tat
  fi
}

ensure_tmux_is_running
