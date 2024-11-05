{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-autoread";
  src = pkgs.fetchFromGitHub {
    owner = "djoshea";
    repo = "vim-autoread";
    rev = "24061f84652d768bfb85d222c88580b3af138dab";
    sha256 = "fSADjNt1V9jgAPjxggbh7Nogcxyisi18KaVve8j+c3w=";
  };
}
