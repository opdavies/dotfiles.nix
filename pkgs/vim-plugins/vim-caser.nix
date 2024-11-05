{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-caser";
  src = pkgs.fetchFromGitHub {
    owner = "arthurxavierx";
    repo = "vim-caser";
    rev = "6bc9f41d170711c58e0157d882a5fe8c30f34bf6";
    sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
  };
}
