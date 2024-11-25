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
        lemp11 = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // {
            desktop = true;
          };

          modules = [ ./nix/hosts/lemp11 ];
        };
      };

      homeConfigurations = {
        "${username}@PW05CH3L" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = specialArgs // {
            desktop = false;
            hostname = "PW05CH3L";
          };

          modules = [ ./nix/home/opdavies ];
        };
      };
    };
}
