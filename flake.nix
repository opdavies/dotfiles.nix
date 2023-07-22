{
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    inputs@{ flake-parts, home-manager, nixpkgs, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, self', nixpkgs, ... }: {
        packages.default = self'.packages.activate;

        formatter = pkgs.nixpkgs-fmt;
      };

      flake = {
        nixosConfigurations = {
          apollo = nixpkgs.lib.nixosSystem {
            modules = [
              ./system/nixos/apollo/configuration.nix

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.opdavies = import ./home-manager/apollo.nix;
              }
            ];
          };

          nixedo = nixpkgs.lib.nixosSystem {
            modules = [
              ./system/nixos/nixedo/configuration.nix

              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.opdavies = import ./home-manager/nixedo.nix;
              }
            ];
          };
        };

        homeConfigurations = {
          wsl2 = home-manager.lib.homeManagerConfiguration {
            modules = [ ./system/wsl2.nix ];
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };
        };
      };
    };
}
