{ self, ... }:
{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = "${self}/zellij";
    recursive = true;
  };
}
