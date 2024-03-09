{
  inputs,
  self,
  system,
  username,
}: {
  desktop ? false,
}: let
  configuration = import ./configuration.nix {inherit desktop inputs system;};
  hardwareConfiguration = import ./hardware-configuration.nix;
in
  inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit inputs desktop self system username;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users."${username}" = import ./home-manager;
        };
      }

      configuration
      hardwareConfiguration
    ];
  }
