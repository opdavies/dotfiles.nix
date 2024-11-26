{ config, lib, ... }:

{
  options.features.desktop.homelab.gitea.enable = lib.mkEnableOption "Enable gitea";

  config = lib.mkIf config.features.desktop.homelab.gitea.enable {
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
