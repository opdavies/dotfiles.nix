{ config, lib, ... }:

{
  options.features.homelab.jellyfin.enable = lib.mkEnableOption "Enable jellyfin";

  config = lib.mkIf config.features.homelab.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
