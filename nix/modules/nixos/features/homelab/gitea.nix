{ config, lib, ... }:

with lib;

let
  port = 2222;
in
{
  options.features.homelab.gitea.enable = mkEnableOption "Enable gitea";

  config = mkIf config.features.homelab.gitea.enable {
    services = {
      gitea = {
        enable = true;
        group = "media";
        stateDir = "/mnt/media/gitea";

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

        virtualHosts."gitea.davies.home".locations."/".proxyPass = "http://localhost:${toString port}/";
      };
    };
  };
}
