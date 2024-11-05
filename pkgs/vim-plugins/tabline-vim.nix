{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "tabline-vim";
  src = pkgs.fetchFromGitHub {
    owner = "mkitt";
    repo = "tabline.vim";
    rev = "69c9698a3240860adaba93615f44778a9ab724b4";
    sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
  };
}
