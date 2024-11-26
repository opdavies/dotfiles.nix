{
  config,
  desktop,
  hostname,
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

  shared-config = import "${self}/nix/lib/shared/home-manager.nix" {
    inherit
      config
      hostname
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
  imports = [ shared-config ];

  home.packages =
    shared-packages
    ++ pkgs.lib.optionals desktop (
      with pkgs;
      [
        build-glove80
        gscan2pdf
        handbrake
        meslo-lg
        obs-studio
        okular
        pamixer
        pavucontrol
        xcape
        xsel
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
