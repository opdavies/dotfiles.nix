{ inputs, pkgs, ... }:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;

  inherit (pkgs) writeShellApplication;

  scripts = {
    notetaker = writeShellApplication (import ./scripts/notetaker.nix);
    run = writeShellApplication (import ./scripts/run.nix { inherit pkgs; });
    t = writeShellApplication (import ./scripts/t.nix { inherit pkgs; });
  };
in
with pkgs;
[
  scripts.notetaker
  scripts.run
  scripts.t

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
  tldr
  tree
  tree-sitter
  unzip
  virtualenv
  wget
  xcp
  xdg-utils
  xh
  yarn
]
