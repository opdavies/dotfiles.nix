{
  services.nginx.virtualHosts."tailwindcss-demo.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/tailwindcss-demo.oliverdavies.uk";
    extraConfig = ''
      add_header X-Robots-Tag "noindex, nofollow";
    '';
  };
}
