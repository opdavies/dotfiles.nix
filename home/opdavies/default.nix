{
  config,
  desktop,
  inputs,
  pkgs,
  self,
  username,
  ...
}:
let
  desktop-config = import ./desktop.nix {
    inherit
      config
      inputs
      pkgs
      username
      ;
  };
  shared-config = import "${self}/lib/shared/home-manager.nix" {
    inherit
      inputs
      pkgs
      self
      username
      ;
  };
  shared-packages = import "${self}/lib/shared/home-manager-packages.nix" {
    inherit
      desktop
      inputs
      pkgs
      username
      ;
  };
in
{
  imports =
    if desktop then
      [
        desktop-config
        shared-config
      ]
    else
      [ shared-config ];

  home.packages =
    shared-packages
    ++ pkgs.lib.optionals desktop (
      with pkgs;
      [
        brave
        discord
        gimp
        gscan2pdf
        handbrake
        kdenlive
        meslo-lg
        obs-studio
        okular
        pamixer
        pass
        pavucontrol
        pinentry
        via
        pocket-casts
        xcape
        xsel
        zoom-us
      ]
    );

  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PATH = "$PATH:./vendor/bin:./node_modules/.bin";
    PULUMI_SKIP_UPDATE_CHECK = "true";
    REPOS = "$HOME/Code";
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
  };
}
