{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-heritage";
  src = pkgs.fetchFromGitHub {
    owner = "jessarcher";
    repo = "vim-heritage";
    rev = "cffa05c78c0991c998adc4504d761b3068547db6";
    sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
  };
}
