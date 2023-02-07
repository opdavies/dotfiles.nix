# https://nix-community.github.io/home-manager/index.html#ch-nix-flakes
{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    neovim-nightly = {
      # workaround: https://github.com/nix-community/neovim-nightly-overlay/issues/164
      inputs.nixpkgs.url = "github:nixos/nixpkgs?rev=fad51abd42ca17a60fc1d4cb9382e2d79ae31836";
      url = "github:nix-community/neovim-nightly-overlay";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, neovim-nightly, nixpkgs, ... }:
  let
    overlays = [ neovim-nightly.overlay ];
  in {
    nixosConfigurations = {
      apollo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/apollo/configuration.nix
          { nixpkgs.overlays = overlays; }
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.opdavies = import ./home-manager/apollo.nix;
          }
        ];
      };
    };

    homeConfigurations = {
      pop-os = home-manager.lib.homeManagerConfiguration {
        modules = [     
          { nixpkgs.overlays = overlays; }
          ./configuration/pop-os
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };

      wsl2 = home-manager.lib.homeManagerConfiguration {
        modules = [     
          { nixpkgs.overlays = overlays; }
          ./configuration/wsl2
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
  };
}
