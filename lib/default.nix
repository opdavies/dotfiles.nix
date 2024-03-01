{inputs}: let
  system = "x86_64-linux";
  username = "opdavies";
in {
  mkNixos = {}: {desktop ? true}:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        (import ./nixos/configuration.nix {inherit desktop inputs system;})
        (import ./nixos/hardware-configuration.nix)

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users."${username}" = {pkgs, ...}: {
              imports = [
                (import ./shared/home-manager.nix {inherit inputs username;})
              ];
            };
          };
        }
      ];
    };

  mkWsl = {}: {}:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        inputs.home-manager.lib.homeManagerConfiguration
        {
          modules = [
            {
              imports = [
                (import ./shared/home-manager.nix {inherit inputs username;})
              ];

              home.packages = import ../shared/home-manager-packages.nix {inherit inputs pkgs;};

              home.sessionVariables = {
                EDITOR = "nvim";
                PATH = "$PATH:./vendor/bin:./node_modules/.bin";
                RIPGREP_CONFIG_PATH = "$HOME/.config/ripgrep/config";
              };
            }
          ];
        }
      ];
    };
}
