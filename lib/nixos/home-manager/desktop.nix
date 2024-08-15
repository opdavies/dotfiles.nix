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
    ./modules/desktop/bluetuith.nix
    ./modules/espanso.nix
    ./modules/gtk.nix
    ./modules/flameshot.nix
    ./modules/gtk.nix
    ./modules/mpv.nix
  ];
}
