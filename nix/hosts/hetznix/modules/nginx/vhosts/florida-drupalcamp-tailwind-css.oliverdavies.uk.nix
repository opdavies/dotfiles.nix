{
  services.nginx.virtualHosts."florida-drupalcamp-tailwind-css.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/florida-drupalcamp-tailwind-css.oliverdavies.uk";
    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
