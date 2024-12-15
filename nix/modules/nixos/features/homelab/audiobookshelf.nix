{ config, ... }:

{
  services.audiobookshelf = {
    enable = true;

    host = "audiobookshelf.davies.home";
    port = 4001;
  };

  services.nginx = {
    enable = true;

    virtualHosts."audiobookshelf.davies.home" = {
      locations."/" = {
        proxyPass = "http://localhost:${toString config.services.audiobookshelf.port}/";
        proxyWebsockets = true;
      };
    };
  };
}
