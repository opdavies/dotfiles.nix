{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "standard-vim";
  src = pkgs.fetchFromGitHub {
    owner = "tjdevries";
    repo = "standard.vim";
    rev = "master";
    sha256 = "9VwkvV1Dv6cE4uDkPp36DozjWJOclDR883yDMYw000E=";
  };
}
