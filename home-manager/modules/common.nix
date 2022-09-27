{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    just
    neovim
  ];

  programs.bat.enable = true;
}
