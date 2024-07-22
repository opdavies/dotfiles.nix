{
  config,
  inputs,
  pkgs,
  username,
}:
{
  imports = [
    ./modules/alacritty.nix
    ./modules/copyq.nix
    ./modules/espanso.nix
    ./modules/gtk.nix
    ./modules/feh.nix
    ./modules/flameshot.nix
    ./modules/gtk.nix
    ./modules/mpv.nix
  ];
}
