{ pkgs, ... }:

let
  nixpkgs = import ./shared/nixpkgs.nix { };
in
{
  imports = [
    ../home-manager/modules/common.nix
    ../home-manager/modules/git.nix
    ../home-manager/modules/home-manager.nix
    ../home-manager/modules/tmux.nix
    ../home-manager/modules/zsh.nix
  ];

  nixpkgs = nixpkgs;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains-mono
  ];
}
