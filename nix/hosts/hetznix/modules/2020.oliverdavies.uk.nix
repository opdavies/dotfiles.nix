{
  services.nginx.virtualHosts."2020.oliverdavies.uk" = {
    enableACME = true;
    forceSSL = true;
    root = "/var/www/vhosts/2020.oliverdavies.uk";
    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
