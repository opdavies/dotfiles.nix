{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.homelab.immich.enable = lib.mkEnableOption "Enable immich";

  config = lib.mkIf config.features.homelab.immich.enable {
    services.immich.enable = true;

    environment.systemPackages = [ pkgs.immich-cli ];
  };
}
