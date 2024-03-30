{ inputs, pkgs, ... }:
let
  php = pkgs.php82;
  phpPackages = pkgs.php82Packages;
in with pkgs; [
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
  inputs.nixpkgs-2311.legacyPackages.${pkgs.system}.awscli2
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
