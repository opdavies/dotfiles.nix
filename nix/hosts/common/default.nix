{
  hostname,
  inputs,
  outputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    outputs.nixosModules.default
  ];

  networking.hostName = hostname;
}
