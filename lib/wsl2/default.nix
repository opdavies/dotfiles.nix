{
  inputs,
  self,
  system,
  username,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};

  shared-config = import ../shared/home-manager.nix {inherit inputs pkgs self username;};
  shared-packages = import ../shared/home-manager-packages.nix {inherit inputs pkgs;};
in
  inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    modules = [
      {
        imports = [shared-config];

        home.packages = shared-packages;

        home.sessionVariables = {
          EDITOR = "nvim";
          PATH = "$PATH:./vendor/bin:./node_modules/.bin";
          PULUMI_SKIP_UPDATE_CHECK = "true";
          RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
        };
      }
    ];
  }
