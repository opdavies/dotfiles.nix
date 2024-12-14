{ config, ... }:

{
  services.audiobookshelf = {
    enable = true;

    host = "audiobookshelf.localhost";
    port = 4001;
  };

  services.nginx = {
    enable = true;

    virtualHosts."audiobookshelf.localhost" = {
      locations."/" = {
        proxyPass = "http://localhost:${toString config.services.audiobookshelf.port}/";
        proxyWebsockets = true;
      };
    };
  };
}
