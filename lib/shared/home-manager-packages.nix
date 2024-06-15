{ inputs, pkgs, ... }:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;

  inherit (pkgs) writeShellApplication;

  script-t = writeShellApplication {
    name = "t";
    text = ''
      # Credit to ThePrimeagen.

      set -o nounset
      set -o pipefail

      if [[ $# -eq 1 ]]; then
        selected=$1
      else
        # Get the session name from fuzzy-finding list of directories and generating a
        # tmux-safe version.
        items=$(find ~/Code/* ~/Code ~ ~/Documents /tmp \
          -maxdepth 1 -mindepth 1 -type d \
          ! -name "*-old" \
          ! -name "*.old"
        )

        selected=$(echo "''${items}" | fzf)
      fi

      if [[ -z "''${selected}" ]]; then
        exit 0
      fi

      session_name=$(basename "''${selected}" | sed 's/\./_/g')
      session_path="''${selected}"

      # Git worktrees.
      if [[ -e "''${selected}/main" ]]; then
        session_path="''${selected}/main"
      fi

      if tmux has-session -t "''${session_name}" 2> /dev/null; then
        tmux attach -t "''${session_name}"
      fi

      tmux new-session -d -s "''${session_name}" -c "''${session_path}"

      tmux switch-client -t "''${session_name}" || tmux attach -t "''${session_name}"
    '';
  };
in
with pkgs;
[
  script-t

  inputs.build-configs.packages.${pkgs.system}.default

  awscli2
  bitwarden-cli
  bottom
  cachix
  ctop
  delta
  dog
  doppler
  entr
  fd
  file
  gcc
  gh
  git
  git-crypt
  gnupg
  go
  htop
  inotify-tools
  jq
  lua
  mysql
  php
  phpPackages.composer
  pv
  rustywind
  tldr
  tree
  tree-sitter
  unzip
  virtualenv
  wget
  xcp
  xh
  yarn
]
