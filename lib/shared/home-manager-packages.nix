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
  export-video-list = writeShellApplication (
    import ./scripts/export-video-list.nix { inherit pkgs username; }
  );
  notetaker = writeShellApplication (import ./scripts/notetaker.nix);
  run = writeShellApplication (import ./scripts/run.nix { inherit pkgs; });
  t = writeShellApplication (import ./scripts/t.nix { inherit pkgs; });
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
  mob
  mysql
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
  watchexec
  wget
  xclip
  xcp
  xdg-utils
  xh
  yarn

  # Scripts.
  notetaker
  run
  t
]
++ pkgs.lib.optionals desktop [
  # Scripts.
  _timer
  export-video-list
  timer
]
