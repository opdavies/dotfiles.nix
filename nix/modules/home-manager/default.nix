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

    ./alacritty.nix
    ./bat.nix
    ./bin.nix
    ./bluetuith.nix
    ./copyq.nix
    ./direnv.nix
    ./espanso.nix
    ./flameshot.nix
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./lsd.nix
    ./mpv.nix
    ./pet.nix
    ./phpactor.nix
    ./ripgrep.nix
    ./starship.nix
    ./syncthing.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
