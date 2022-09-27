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
