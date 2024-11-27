{
  config,
  inputs,
  lib,
  self,
  pkgs,
  ...
}:

{
  imports = [
    (import ./features/cli {
      inherit
        config
        inputs
        lib
        self
        pkgs
        ;
    })
    ./features/desktop
  ];
}
