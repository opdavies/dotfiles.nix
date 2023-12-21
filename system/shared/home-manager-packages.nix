{ inputs, pkgs, ... }:
let
  pkgsUnstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";
in
with pkgs; [
  awscli2
  bottom
  ctop
  delta
  dog
  doppler
  fd
  file
  fzf
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
  neofetch
  pkgsUnstable.eza
  pkgsUnstable.rustywind
  pv
  ripgrep
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
