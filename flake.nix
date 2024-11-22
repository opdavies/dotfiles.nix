{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2405.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs =
    {
      nixos-hardware,
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      username = "opdavies";

      mkNixos = import ./nix/lib/nixos {
        inherit
          inputs
          outputs
          nixos-hardware
          pkgs
          self
          username
          ;
      };
      mkWsl = import ./nix/lib/wsl2 {
        inherit
          inputs
          outputs
          self
          username
          ;
      };

      inherit (pkgs) mkShell;
      inherit (pkgs.vimUtils) buildVimPlugin;
    in
    {
      packages.${system} = {
        default = mkShell { buildInputs = with pkgs; [ bashInteractive ]; };

        opdavies-nvim = buildVimPlugin {
          name = "opdavies-nvim";
          src = ./nvim;
        };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./nix/overlays { inherit inputs; };

      nixosConfigurations = {
        lemp11 = mkNixos {
          desktop = true;
          hostname = "lemp11";

          # TODO: move the rest of the modules here.
          modules = [
            nixos-hardware.nixosModules.common-cpu-intel
            nixos-hardware.nixosModules.common-gpu-intel
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-hdd
            nixos-hardware.nixosModules.system76
          ];
        };
      };

      homeConfigurations = {
        wsl2 = mkWsl { system = "x86_64-linux"; };
      };
    };
}
