{ pkgs, ... }:
{
  fonts = {
    monospace = {
      name = "Terminus";
      # fc-list : family | sort | grep "Nerd Font"

      package = pkgs.nerdfonts.override { fonts = [ "Meslo" ]; };
      size = "10";
    };
  };
}
