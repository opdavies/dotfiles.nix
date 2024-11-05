{
  inputs,
  outputs,
  self,
  username,
}:
{ system }:

let
  inherit (pkgs) lib;

  pkgs = import inputs.nixpkgs {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
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
    inherit inputs pkgs username;
    desktop = false;
  };
in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit self;
  };

  modules = [
    {
      imports = [ shared-config ];

      home.packages = shared-packages ++ [ pkgs.wsl-open ];

      home.sessionVariables = {
        DIRENV_LOG_FORMAT = "";
        EDITOR = "nvim";
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
  ];
}
