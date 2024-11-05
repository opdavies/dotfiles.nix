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
    (import ./modules/git.nix { inherit inputs pkgs; })
    (import ./modules/neovim.nix { inherit inputs pkgs; })
    ./modules/bat.nix
    ./modules/bin.nix
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/lsd.nix
    ./modules/pet.nix
    ./modules/phpactor.nix
    ./modules/ripgrep.nix
    ./modules/syncthing.nix
    ./modules/tmux.nix
    ./modules/zellij.nix
    ./modules/zsh.nix
  ];
}
