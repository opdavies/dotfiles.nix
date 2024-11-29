{
  services.nginx.virtualHosts."wp-tailwind.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/wp-tailwind.oliverdavies.uk";
    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
