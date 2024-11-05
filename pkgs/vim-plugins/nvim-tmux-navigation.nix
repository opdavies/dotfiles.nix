{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  name = "nvim-tmux-navigation";
  src = pkgs.fetchFromGitHub {
    owner = "alexghergh";
    repo = "nvim-tmux-navigation";
    rev = "4898c98702954439233fdaf764c39636681e2861";
    sha256 = "sha256-CxAgQSbOrg/SsQXupwCv8cyZXIB7tkWO+Y6FDtoR8xk=";
  };
}
