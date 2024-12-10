{ config, lib, ... }:

with lib;

{
  options.features.homelab.jellyfin.enable = mkEnableOption "Enable jellyfin";

  config = mkIf config.features.homelab.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
