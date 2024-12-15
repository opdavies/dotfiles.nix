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
    services.immich = {
      enable = true;
      group = "media";
      mediaLocation = "/mnt/media/immich";
    };

    environment.systemPackages = [ pkgs.immich-cli ];

    services.nginx = {
      enable = true;

      virtualHosts."immich.davies.home".locations."/".proxyPass = "http://localhost:${toString config.services.immich.port}/";
    };
  };
}
