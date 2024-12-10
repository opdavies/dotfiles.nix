{ config, lib, ... }:

with lib;

{
  options.features.homelab.gitea.enable = mkEnableOption "Enable gitea";

  config = mkIf config.features.homelab.gitea.enable {
    services.gitea = {
      enable = true;

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
