{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs =
    inputs@{ flake-parts, home-manager, nixpkgs, nixpkgs-unstable, self, ... }:
    let
      system = "x86_64-linux";

      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable {
          inherit inputs system;
        };
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, self', nixpkgs, ... }: {
        packages.default = self'.packages.activate;

        formatter = pkgs.nixpkgs-fmt;
      };

      flake = {
        nixosConfigurations = {
          nixedo = nixpkgs.lib.nixosSystem {
            inherit specialArgs;

            modules = [
              ./system/nixos/nixedo/configuration.nix

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  extraSpecialArgs = specialArgs;
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.opdavies = import ./home-manager/nixedo.nix;
                };
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
