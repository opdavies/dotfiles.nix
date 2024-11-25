{
  config,
  desktop,
  inputs,
  outputs,
  self,
  system,
  username,
  ...
}:
let
  pkgs = import inputs.nixpkgs {
    inherit system;

    config = {
      allowUnfree = true;

      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
    };

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  inherit (pkgs) lib;

  desktop-config = import ./desktop.nix {
    inherit
      config
      inputs
      pkgs
      username
      ;
  };

  shared-config = import "${self}/nix/lib/shared/home-manager.nix" {
    inherit
      config
      inputs
      lib
      pkgs
      self
      username
      ;
  };

  shared-packages = import "${self}/nix/lib/shared/home-manager-packages.nix" {
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
        build-glove80
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

        pkgs.nixpkgs-2405.zoom-us
      ]
    );

  home.sessionVariables = {
    DIRENV_LOG_FORMAT = "";
    EDITOR = "nvim";
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    LC_CTYPE = "en_GB.UTF-8";
    PATH = lib.concatStringsSep ":" [
      "$PATH"
      "$HOME/go/bin"
      "./vendor/bin"
      "./node_modules/.bin"
    ];
    PULUMI_SKIP_UPDATE_CHECK = "true";
    REPOS = "$HOME/Code";
    RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
  };
}
