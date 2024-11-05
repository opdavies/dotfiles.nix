{ self, ... }:
{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = "${self}/config/zellij";
    recursive = true;
  };
}
