{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    opdavies-nvim.inputs.nixpkgs.follows = "nixpkgs";
    opdavies-nvim.url = "github:opdavies/opdavies.nvim";
  };

  outputs = inputs @ {
    flake-parts,
    self,
    ...
  }: let
    system = "x86_64-linux";
    username = "opdavies";

    pkgs = inputs.nixpkgs.legacyPackages.${system};

    nixos-system = import ./system/nixos {inherit inputs pkgs self system username;};
    wsl-system = import ./system/wsl2 {inherit inputs pkgs self system username;};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      perSystem = {
        pkgs,
        self',
        ...
      }: {
        packages.default = pkgs.mkShell {
          nativeBuildInputs = [pkgs.just];
        };

        formatter = pkgs.alejandra;
      };

      flake = {
        nixosConfigurations = {
          apollo = nixos-system {
            desktop = true;
            hostname = "apollo";
          };

          nixedo = nixos-system {
            desktop = true;
            hostname = "nixedo";
          };
        };

        homeConfigurations = {
          wsl2 = wsl-system;
        };
      };
    };
}
