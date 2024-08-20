{
  inputs,
  self,
  username,
}:
{ system }:

let
  pkgs = inputs.nixpkgs.legacyPackages.${system};

  shared-config = import "${self}/lib/shared/home-manager.nix" {
    inherit
      inputs
      pkgs
      self
      username
      ;
  };

  shared-packages = import "${self}/lib/shared/home-manager-packages.nix" {
    inherit inputs pkgs;
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
        EDITOR = "nvim";
        PATH = "$PATH:./vendor/bin:./node_modules/.bin";
        PULUMI_SKIP_UPDATE_CHECK = "true";
        REPOS = "$HOME/Code";
        RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
      };
    }
  ];
}
