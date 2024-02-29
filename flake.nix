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

    mkNixos = import ./lib/nixos {inherit inputs pkgs self system username;};
    mkWsl = import ./lib/wsl2 {inherit inputs pkgs self system username;};
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
        lib = import ./lib {inherit inputs;};

        nixosConfigurations = {
          apollo = mkNixos {desktop = true;};
          nixedo = mkNixos {desktop = true;};
        };

        homeConfigurations = {
          wsl2 = mkWsl;
        };
      };
    };
}
