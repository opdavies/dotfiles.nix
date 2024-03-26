{ config, inputs, pkgs, username, }: {
  imports = [
    ./modules/alacritty.nix
    ./modules/copyq.nix
    ./modules/dunst.nix
    ./modules/espanso.nix
    ./modules/gtk.nix
    ./modules/feh.nix
    ./modules/flameshot.nix
    ./modules/kanshi.nix
    ./modules/sway.nix
  ];
}
