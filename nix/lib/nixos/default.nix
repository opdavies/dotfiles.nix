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
  modules ? [ ],
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
  ] ++ modules;
}
