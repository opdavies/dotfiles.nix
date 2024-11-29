{
  services.nginx.virtualHosts."rebuilding-symfony.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/rebuilding-symfony.oliverdavies.uk";
    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
