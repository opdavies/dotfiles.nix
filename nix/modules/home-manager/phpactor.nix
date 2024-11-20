{ self, ... }:
{
  xdg.configFile.phpactor = {
    source = "${self}/phpactor";
    recursive = true;
  };
}
