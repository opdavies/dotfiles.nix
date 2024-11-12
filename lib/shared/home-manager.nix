{
  inputs,
  pkgs,
  username,
  self,
}:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ../../modules/home-manager/git.nix { inherit inputs pkgs; })
    (import ../../modules/home-manager/neovim.nix { inherit inputs pkgs; })
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/bin.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/fzf.nix
    ../../modules/home-manager/lsd.nix
    ../../modules/home-manager/pet.nix
    ../../modules/home-manager/phpactor.nix
    ../../modules/home-manager/ripgrep.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/syncthing.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/zellij.nix
    ../../modules/home-manager/zsh.nix
  ];
}
