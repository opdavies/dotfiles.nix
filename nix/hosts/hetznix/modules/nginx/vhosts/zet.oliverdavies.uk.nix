{
  services.nginx.virtualHosts."zet.oliverdavies.uk" = {
    useACMEHost = "oliverdavies.uk";
    forceSSL = true;
    root = "/var/www/vhosts/zet.oliverdavies.uk/output_prod";
  };
}
