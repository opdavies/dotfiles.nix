{
  config,
  inputs,
  pkgs,
  username,
}:
{
  imports = [
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/copyq.nix
    ../../modules/home-manager/bluetuith.nix
    ../../modules/home-manager/espanso.nix
    ../../modules/home-manager/gtk.nix
    ../../modules/home-manager/flameshot.nix
    ../../modules/home-manager/gtk.nix
    ../../modules/home-manager/mpv.nix
  ];
}