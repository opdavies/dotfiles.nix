{ config, ... }:

{
  services.nginx = {
    enable = true;

    virtualHosts = {
      "syncthing.localhost".locations."/".proxyPass = "http://localhost:8384/";
    };
  };
}
