{ self, ... }:
{
  xdg.configFile.phpactor = {
    source = "${self}/config/phpactor";
    recursive = true;
  };
}
