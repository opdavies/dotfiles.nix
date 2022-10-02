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
  in {
    nixosConfigurations = {
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixpkgs/nixos/apollo/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.opdavies = import ./nixpkgs/home-manager/apollo.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      pop-os = home-manager.lib.homeManagerConfiguration {
        modules = [     
          { nixpkgs.overlays = overlays; }
          ./nixpkgs/configuration/pop-os
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };

      wsl2 = home-manager.lib.homeManagerConfiguration {
        modules = [     
          { nixpkgs.overlays = overlays; }
          ./nixpkgs/configuration/wsl2
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
  };
}
