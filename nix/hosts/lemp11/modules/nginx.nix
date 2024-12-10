{
  services.nginx = {
    enable = true;

    virtualHosts = {
      "gitea.localhost".locations."/".proxyPass = "http://localhost:2222/";
      "immich.localhost".locations."/".proxyPass = "http://localhost:2283/";
      "jellyfin.localhost".locations."/".proxyPass = "http://localhost:8096/";
      "tubearchivist.localhost".locations."/".proxyPass = "http://localhost:8000/";
    };
  };
}
