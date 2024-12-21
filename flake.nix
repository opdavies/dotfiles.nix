{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";

    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2405.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs =
    {
      disko,
      home-manager,
      nixpkgs,
      self,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      username = "opdavies";

      specialArgs = {
        inherit
          inputs
          outputs
          self
          system
          username
          ;
      };

      inherit (pkgs) mkShell;
    in
    {
      packages.${system} = {
        default = mkShell { buildInputs = with pkgs; [ bashInteractive ]; };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      overlays = import ./nix/overlays { inherit inputs; };

      nixosModules.default = ./nix/modules/nixos;

      nixosConfigurations = {
        lemp11 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            desktop = true;
            hostname = "lemp11";
          };

          modules = [ ./nix/hosts/lemp11 ];
        };

        hetznix = nixpkgs.lib.nixosSystem {
          inherit specialArgs system;

          modules = [
            disko.nixosModules.disko
            ./nix/hosts/hetznix/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "${username}@PW05CH3L" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = specialArgs // {
            desktop = false;
            hostname = "PW05CH3L";
          };

          modules = [
            ./nix/home/opdavies
          ];
        };
      };
    };
}
