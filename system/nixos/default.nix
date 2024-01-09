{ inputs, pkgs, self, system, username }:

{ desktop ? false, hostname }:

let
  configuration = import ./configuration.nix { inherit desktop hostname inputs pkgs system; };
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
        users."${username}" = import ./home-manager;
      };
    }

    configuration
    hardware-configuration
  ];
}
