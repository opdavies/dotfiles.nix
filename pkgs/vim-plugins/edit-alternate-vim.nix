{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "edit-alternate-vim";
  src = pkgs.fetchFromGitHub {
    owner = "tjdevries";
    repo = "edit_alternate.vim";
    rev = "master";
    sha256 = "mEKnqYAhgrdxPRoKf4S4yYecdFIHGg8bDxpqPuC1+S4=";
  };
}
