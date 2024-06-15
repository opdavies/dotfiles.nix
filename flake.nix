{
  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-24.05";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    opdavies-nvim.inputs.nixpkgs.follows = "nixpkgs";
    opdavies-nvim.url = "github:opdavies/opdavies.nvim";
    # opdavies-nvim.url = "path:/home/opdavies/Code/personal/opdavies.nvim";

    build-configs.inputs.nixpkgs.follows = "nixpkgs";
    build-configs.url = "path:/home/opdavies/Code/personal/build-configs";
    # TODO: how to do this with a private GitHub repository?
    # build-configs.url = "github:OliverDaviesLtd/build-configs";
  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      username = "opdavies";

      mkNixos = import ./lib/nixos {
        inherit
          inputs
          pkgs
          self
          username
          ;
      };
      mkWsl = import ./lib/wsl2 { inherit inputs self username; };

      inherit (pkgs) mkShell;
    in
    {
      packages.${system}.default = mkShell { buildInputs = with pkgs; [ just ]; };

      formatter.${system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations = {
        apollo = mkNixos {
          desktop = true;
          hostname = "apollo";
        };

        nixedo = mkNixos {
          desktop = true;
          hostname = "nixedo";
        };
      };

      homeConfigurations = {
        wsl2 = mkWsl { system = "x86_64-linux"; };
      };
    };
}
