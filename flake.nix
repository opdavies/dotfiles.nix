{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2311.url = "github:nixos/nixpkgs/nixos-23.11";

    opdavies-nvim.inputs.nixpkgs.follows = "nixpkgs";
    opdavies-nvim.url = "github:opdavies/opdavies.nvim";
    # opdavies-nvim.url = "path:/home/opdavies/Code/github.com/opdavies/opdavies.nvim";
  };

  outputs = inputs@{ flake-parts, self, ... }:
    let
      username = "opdavies";

      mkNixos = import ./lib/nixos { inherit inputs self username; };
      mkWsl = import ./lib/wsl2 { inherit inputs self username; };
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, self', ... }: {
        packages.default =
          pkgs.mkShell { nativeBuildInputs = [ pkgs.nixfmt pkgs.just ]; };

        formatter = pkgs.nixfmt;
      };

      flake = {
        lib = import ./lib { inherit inputs; };

        nixosConfigurations = {
          apollo = mkNixos { desktop = true; hostname = "apollo"; };
          nixedo = mkNixos { desktop = true; hostname = "nixedo"; };
        };

        homeConfigurations = { wsl2 = mkWsl; };
      };
    };
}
