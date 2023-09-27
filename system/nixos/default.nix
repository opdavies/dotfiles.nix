{ inputs, self, username }:

{ desktop }:

let
  configuration = import ./configuration.nix;
  hardware-configuration = import ./hardware-configuration.nix;
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = { inherit inputs desktop self username; };
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${username}" = import ./home-manager.nix;
      };
    }

    configuration
    hardware-configuration
  ];
}
