{
  inputs,
  pkgs,
  username,
  self,
}:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ./modules/neovim.nix { inherit inputs; })
    ./modules/atuin.nix
    ./modules/bat.nix
    ./modules/bin.nix
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/lsd.nix
    ./modules/nnn.nix
    ./modules/phpactor.nix
    ./modules/ripgrep.nix
    ./modules/syncthing.nix
    ./modules/tmux.nix
    ./modules/wezterm.nix
    ./modules/zsh.nix
  ];
}
