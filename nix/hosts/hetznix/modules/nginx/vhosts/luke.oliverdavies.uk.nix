{
  services.nginx.virtualHosts."luke.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/luke.oliverdavies.uk";

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
