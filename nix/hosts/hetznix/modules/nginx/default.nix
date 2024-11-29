{
  services.nginx = {
    enable = true;
    serverNamesHashBucketSize = 256;
  };

  imports = [
    ./vhosts/2020.oliverdavies.uk.nix
    ./vhosts/bootstrap-with-tailwind.oliverdavies.uk.nix
    ./vhosts/florida-drupalcamp-tailwind-css.oliverdavies.uk.nix
    ./vhosts/phpsw-sculpin-demo.oliverdavies.uk.nix
    ./vhosts/rebuilding-acquia.oliverdavies.uk.nix
    ./vhosts/rebuilding-bartik.oliverdavies.uk.nix
    ./vhosts/rebuilding-bristol-js.oliverdavies.uk.nix
    ./vhosts/rebuilding-symfony.oliverdavies.uk.nix
    ./vhosts/tailwindcss-demo.oliverdavies.uk.nix
    ./vhosts/talking-drupal-tailwindcss.oliverdavies.uk.nix
    ./vhosts/wp-tailwind.oliverdavies.uk.nix
    ./vhosts/www.oliverdavies.uk.nix
    ./vhosts/zet.oliverdavies.uk.nix
  ];
}
