{ config, lib, ... }:

with lib;

let
  port = 2223;
in
{
  options.features.homelab.forgejo.enable = mkEnableOption "Enable forgejo";

  config = mkIf config.features.homelab.forgejo.enable {
    services = {
      forgejo = {
        enable = true;
        group = "media";
        stateDir = "/mnt/media/forgejo";

        settings = {
          server = {
            HTTP_PORT = port;
          };

          service = {
            DISABLE_REGISTRATION = true;
          };
        };
      };

      nginx = {
        enable = true;

        virtualHosts."forgejo.davies.home".locations."/".proxyPass = "http://localhost:${toString port}/";
      };
    };
  };
}
