{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    (import ./neovim.nix {
      inherit
        config
        inputs
        lib
        pkgs
        ;
    })

    ./bat.nix
    ./bin.nix
    ./bluetuith.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./htop.nix
    ./lsd.nix
    ./pet.nix
    ./phpactor.nix
    ./ripgrep.nix
    ./starship.nix
    ./syncthing.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
