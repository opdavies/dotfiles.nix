{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      home-manager,
      nixos-hardware,
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      username = "opdavies";

      mkNixos = import ./lib/nixos {
        inherit
          inputs
          nixos-hardware
          pkgs
          self
          username
          ;
      };
      mkWsl = import ./lib/wsl2 { inherit inputs self username; };

      inherit (pkgs) mkShell;
      inherit (pkgs.vimUtils) buildVimPlugin;
    in
    {
      packages.${system} = {
        default = mkShell { buildInputs = with pkgs; [ bashInteractive ]; };

        opdavies-nvim = buildVimPlugin {
          name = "opdavies-nvim";
          src = ./config/neovim;
        };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations = {
        lemp11 = mkNixos {
          desktop = true;
          hostname = "lemp11";
        };
      };

      homeConfigurations = {
        wsl2 = mkWsl { system = "x86_64-linux"; };
      };
    };
}
