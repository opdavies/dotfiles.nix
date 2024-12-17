{
  desktop,
  inputs,
  pkgs,
  username,
  ...
}:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;

  inherit (pkgs) writeShellApplication;

  _timer = writeShellApplication (import ./scripts/_timer.nix);
  deliver = writeShellApplication (import ./scripts/deliver.nix { inherit pkgs; });
  export-video-list = writeShellApplication (
    import ./scripts/export-video-list.nix { inherit pkgs username; }
  );
  run = writeShellApplication (import ./scripts/run.nix { inherit pkgs; });
  timer = writeShellApplication (import ./scripts/timer.nix);
in
with pkgs;
[
  age
  awscli2
  bitwarden-cli
  bottom
  cachix
  ctop
  delta
  devenv
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
  inotify-tools
  jq
  killall
  lua
  mariadb
  mob
  php
  phpPackages.composer
  pv
  rustywind
  simple-http-server
  sshs
  tldr
  tree
  tree-sitter
  unzip
  virtualenv
  w3m
  watchexec
  wget
  xclip
  xcp
  xdg-utils
  xh
  yarn

  # Scripts.
  deliver
  run
]
++ pkgs.lib.optionals desktop [
  # Scripts.
  _timer
  export-video-list
  timer
]
