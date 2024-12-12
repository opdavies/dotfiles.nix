{ config, lib, ... }:

with lib;

{
  options.features.homelab.gitea.enable = mkEnableOption "Enable gitea";

  config = mkIf config.features.homelab.gitea.enable {
    services.gitea = {
      enable = true;
      group = "media";
      stateDir = "/mnt/media/gitea";

      settings = {
        server = {
          HTTP_PORT = 2222;
        };

        service = {
          DISABLE_REGISTRATION = true;
        };
      };
    };
  };
}
