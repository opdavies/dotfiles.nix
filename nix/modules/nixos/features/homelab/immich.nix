{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.homelab.immich.enable = mkEnableOption "Enable immich";

  config = mkIf config.features.homelab.immich.enable {
    services.immich.enable = true;

    environment.systemPackages = [ pkgs.immich-cli ];
  };
}
