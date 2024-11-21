{
  inputs,
  outputs,
  nixos-hardware,
  pkgs,
  self,
  username,
}:
{
  desktop ? false,
  hostname,
}:
let
  configuration = import ./configuration.nix {
    inherit
      outputs
      desktop
      hostname
      username
      inputs
      self
      ;
  };
  hardwareConfiguration = import ./hardware-configuration.nix;
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        extraSpecialArgs = {
          inherit
            inputs
            desktop
            self
            username
            ;
        };
        useGlobalPkgs = true;
        useUserPackages = true;
        users."${username}" = import "${self}/nix/home/${username}";
      };
    }

    configuration
    hardwareConfiguration

    # TODO: only for "lemp11".
    nixos-hardware.nixosModules.common-cpu-intel
    nixos-hardware.nixosModules.common-gpu-intel
    nixos-hardware.nixosModules.common-pc-laptop
    nixos-hardware.nixosModules.common-pc-laptop-hdd
    nixos-hardware.nixosModules.system76
  ];
}
