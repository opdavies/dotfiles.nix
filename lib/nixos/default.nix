{
  inputs,
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
      desktop
      hostname
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
        users."${username}" = import "${self}/home/${username}";
      };
    }

    (import ./modules/awesome.nix {
      inherit
        inputs
        pkgs
        self
        username
        ;
    })
    (import ./modules/autorandr.nix)
    (import ./modules/gnome.nix)

    configuration
    hardwareConfiguration

    nixos-hardware.nixosModules.system76
  ];
}
