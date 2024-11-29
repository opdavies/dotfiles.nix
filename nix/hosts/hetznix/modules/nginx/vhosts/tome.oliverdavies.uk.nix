{
  services.nginx.virtualHosts."tome.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/www.oliverdavies.uk-drupal";

    locations."/" = {
      tryFiles = "$uri $uri/ $uri.html $uri/index.html =404";
      extraConfig = ''
        rewrite ^/(.*[^/])/$ /$1 permanent;
      '';
    };

    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
