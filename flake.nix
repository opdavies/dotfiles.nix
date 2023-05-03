# https://nix-community.github.io/home-manager/index.html#ch-nix-flakes
{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, neovim-nightly, nixpkgs, ... }:
    let
      overlays = [ neovim-nightly.overlay ];
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      nixosConfigurations = {
        apollo = nixpkgs.lib.nixosSystem {
          modules = [
            { nixpkgs.overlays = overlays; }

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
            { nixpkgs.overlays = overlays; }

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
          modules = [{ nixpkgs.overlays = overlays; } ./system/wsl2.nix];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        };
      };
    };
}
