{ inputs, pkgs, username, self, }: {
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ./modules/neovim.nix { inherit inputs; })
    ./modules/bat.nix
    ./modules/bin.nix
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/lsd.nix
    ./modules/nnn.nix
    ./modules/phpactor.nix
    ./modules/ripgrep.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];
}
