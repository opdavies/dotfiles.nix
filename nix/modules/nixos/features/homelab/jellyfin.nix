{ config, lib, ... }:

{
  options.features.desktop.homelab.jellyfin.enable = lib.mkEnableOption "Enable jellyfin";

  config = lib.mkIf config.features.desktop.homelab.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
