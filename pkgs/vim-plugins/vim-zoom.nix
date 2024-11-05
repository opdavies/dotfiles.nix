{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-zoom";
  src = pkgs.fetchFromGitHub {
    owner = "dhruvasagar";
    repo = "vim-zoom";
    rev = "01c737005312c09e0449d6518decf8cedfee32c7";
    sha256 = "/ADzScsG0u6RJbEtfO23Gup2NYdhPkExqqOPVcQa7aQ=";
  };
}
