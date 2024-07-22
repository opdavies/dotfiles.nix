{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    opdavies-nvim.inputs.nixpkgs.follows = "nixpkgs";
    opdavies-nvim.url = "github:opdavies/opdavies.nvim";
    # opdavies-nvim.url = "path:/home/opdavies/Code/opdavies.nvim";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      self,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      username = "opdavies";

      mkWsl = import ./lib/wsl2 { inherit inputs self username; };

      specialArgs = inputs // {
        inherit system;
      };

      shared-modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            useUserPackages = true;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        apollo = nixpkgs.lib.nixosSystem {
          inherit specialArgs system;

          modules = shared-modules ++ [ ./hosts/apollo ];
        };
      };

      homeConfigurations = {
        wsl2 = home-manager.lib.homeManagerConfiguration {
          inherit specialArgs system;

          modules = shared-modules ++ [ ];
        };
      };

      packages.${system}.default = pkgs.mkShell { buildInputs = with pkgs; [ bashInteractive ]; };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
