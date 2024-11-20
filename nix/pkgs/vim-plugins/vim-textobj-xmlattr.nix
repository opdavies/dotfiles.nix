{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-textobj-xmlattr";
  src = pkgs.fetchFromGitHub {
    owner = "whatyouhide";
    repo = "vim-textobj-xmlattr";
    rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
    sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
  };
}
