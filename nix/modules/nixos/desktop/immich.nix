{ pkgs, ... }:

{
  services.immich.enable = true;

  environment.systemPackages = [ pkgs.immich-cli ];
}
