{ inputs, pkgs, ... }:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;

  inherit (pkgs) writeShellApplication;

  script-t = writeShellApplication {
    name = "t";

    runtimeInputs = with pkgs; [
      openssl
      tmux
    ];

    text = ''
      # Credit to ThePrimeagen and Jess Archer.

      if [[ $# -eq 1 ]]; then
        SELECTED_PATH=$1
      else
        # Get the session name from fuzzy-finding list of directories and generating a
        # tmux-safe version.
        items=$(find ~/Code/* ~/Code ~ ~/Documents /tmp \
          -maxdepth 1 -mindepth 1 -type d \
          ! -name "*-old" \
          ! -name "*.old"
        )

        SELECTED_PATH=$(echo "''${items}" | fzf)
      fi

      SESSION_NAME=$(basename "''${SELECTED_PATH}" | sed 's/\./_/g')

      # Attach to an existing session, if one exists.
      if tmux has-session -t "''${SESSION_NAME}" 2> /dev/null; then
        tmux attach -t "''${SESSION_NAME}" || tmux switch-client -t "''${SESSION_NAME}"
        exit
      fi

      # TODO: support .ignored/.tmux
      if [[ -x "''${SELECTED_PATH}/.tmux" ]]; then
        DIGEST="$(openssl sha512 "''${SELECTED_PATH}/.tmux")"

        # Prompt the first time we see a given .tmux file before running it.
        if ! grep -q "''${DIGEST}" ~/..tmux.digests 2> /dev/null; then
          cat "''${SELECTED_PATH}/.tmux"

          read -r -n 1 -p "Trust (and run) this .tmux file? (t = trust, otherwise = skip) "

          if [[ $REPLY =~ ^[Tt]$ ]]; then
            echo "''${DIGEST}" >> ~/..tmux.digests

            # Create a new session and run the .tmux script.
            tmux new-session -d -c "''${SELECTED_PATH}" -s "''${SESSION_NAME}"
            (cd "''${SELECTED_PATH}" && "''${SELECTED_PATH}/.tmux" "''${SESSION_NAME}")
          fi
        else
          # Create a new session and run the .tmux script.
          tmux new-session -d -c "''${SELECTED_PATH}" -s "''${SESSION_NAME}"
          (cd "''${SELECTED_PATH}" && "''${SELECTED_PATH}/.tmux" "''${SESSION_NAME}")
        fi
      fi

      # If there is no session, create one.
      if ! tmux has-session -t "''${SESSION_NAME}" 2> /dev/null; then
        tmux new-session -d -c "''${SELECTED_PATH}" -s "''${SESSION_NAME}"
      fi

      tmux switch-client -t "''${SESSION_NAME}" || tmux attach-session -t "''${SESSION_NAME}"
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
