# https://nix-community.github.io/home-manager/index.html#ch-nix-flakes
{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    # workaround: https://github.com/nix-community/neovim-nightly-overlay/issues/164
    neovim-nightly.inputs.nixpkgs.url =
      "github:nixos/nixpkgs?rev=fad51abd42ca17a60fc1d4cb9382e2d79ae31836";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, neovim-nightly, nixpkgs, ... }:
    let overlays = [ neovim-nightly.overlay ];
    in {
      nixosConfigurations = {
        apollo = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

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
          system = "x86_64-linux";

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
        pop-os = home-manager.lib.homeManagerConfiguration {
          modules = [ { nixpkgs.overlays = overlays; } ./system/pop-os.nix ];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        };

        wsl2 = home-manager.lib.homeManagerConfiguration {
          modules = [ { nixpkgs.overlays = overlays; } ./system/wsl2.nix ];
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        };
      };
    };
}
