{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = inputs@{ flake-parts, self, ... }:
    let
      system = "x86_64-linux";
      username = "opdavies";

      pkgs = inputs.nixpkgs.legacyPackages.${system};

      nixos-system = import ./system/nixos { inherit inputs pkgs self system username; };
      wsl-system = import ./system/wsl2 { inherit inputs pkgs self system username; };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, self', ... }: {
        packages = {
          opdavies-nvim = pkgs.vimUtils.buildVimPlugin {
            name = "opdavies-nvim";
            src = ./config/neovim;
          };
        };

        formatter = pkgs.nixpkgs-fmt;
      };

      flake = {
        nixosConfigurations = {
          nixedo = nixos-system { desktop = true; };
        };

        homeConfigurations = {
          wsl2 = wsl-system;
        };
      };
    };
}
