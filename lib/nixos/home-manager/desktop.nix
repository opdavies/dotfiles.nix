{ config, inputs, pkgs, username, }: {
  imports = [
    ./modules/alacritty.nix
    ./modules/autorandr.nix
    ./modules/copyq.nix
    ./modules/dunst.nix
    ./modules/espanso.nix
    ./modules/feh.nix
    ./modules/flameshot.nix
    ./modules/i3.nix
    ./modules/rofi.nix
  ];
}
