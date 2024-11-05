{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-textobj-indent";
  src = pkgs.fetchFromGitHub {
    owner = "kana";
    repo = "vim-textobj-indent";
    rev = "deb76867c302f933c8f21753806cbf2d8461b548";
    sha256 = "oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
  };
}
