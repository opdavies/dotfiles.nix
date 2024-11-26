{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.homelab.immich.enable = lib.mkEnableOption "Enable immich";

  config = lib.mkIf config.features.desktop.homelab.immich.enable {
    services.immich.enable = true;

    environment.systemPackages = [ pkgs.immich-cli ];
  };
}
