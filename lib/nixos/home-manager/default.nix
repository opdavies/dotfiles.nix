{
  config,
  desktop,
  inputs,
  pkgs,
  self,
  username,
  ...
}: let
  desktop-config = import ./desktop.nix {inherit config inputs pkgs username;};
  shared-config = import ../../shared/home-manager.nix {inherit inputs pkgs self username;};
  shared-packages = import ../../shared/home-manager-packages.nix {inherit inputs pkgs;};
in {
  imports =
    if desktop
    then [desktop-config shared-config]
    else [shared-config];

  home.packages =
    shared-packages
    ++ pkgs.lib.optionals desktop [
      pkgs.discord
      pkgs.gimp
      pkgs.gscan2pdf
      pkgs.kdenlive
      pkgs.meslo-lg
      pkgs.obs-studio
      pkgs.okular
      pkgs.pamixer
      pkgs.pass
      pkgs.pavucontrol
      pkgs.pinentry
      pkgs.slack
      pkgs.via
      pkgs.vlc
      pkgs.xsel
      pkgs.xcape
      pkgs.zoom-us
    ];

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PATH = "$PATH:./vendor/bin:./node_modules/.bin";
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
  };
}
