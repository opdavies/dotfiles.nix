{ inputs, pkgs, ... }:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;
in
with pkgs;
[
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
