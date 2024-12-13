{ config, lib, ... }:

with lib;

{
  options.features.homelab.paperless.enable = mkEnableOption "Enable paperless";

  config = mkIf config.features.homelab.paperless.enable {
    services.paperless = {
      enable = true;
    };
  };
}
