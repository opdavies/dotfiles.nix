#!/usr/bin/env bash

set -o errexit
set -o nounset

session_name="${1:-dotfiles-nix}"
session_path="${2:-$(pwd)}"

if tmux has-session -t="${session_name}" 2> /dev/null; then
  tmux attach -t "${session_name}" ||
    tmux switch-client -t "${session_name}"
fi

tmux new-session -d -s "${session_name}" -n vim -c "${session_path}"

# 1. Main window: Vim
tmux send-keys -t "${session_name}:vim" "nvim" Enter

# 2. General shell use.
tmux new-window -t "${session_name}" -c "${session_path}"

tmux switch-client -t "${session_name}:vim.left" ||
  tmux attach -t "${session_name}:vim.left"
