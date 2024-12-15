{ config, lib, ... }:

with lib;

{
  options.features.homelab.jellyfin.enable = mkEnableOption "Enable jellyfin";

  config = mkIf config.features.homelab.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
      group = "media";
      configDir = "/mnt/media/jellyfin";
    };

    services.nginx = {
      enable = true;

      virtualHosts."jellyfin.davies.home".locations."/".proxyPass = "http://localhost:8096/";
    };
  };
}
