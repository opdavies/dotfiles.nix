{
  config,
  inputs,
  lib,
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
        pkgs
        ;
    })

    ./features/desktop
  ];
}
