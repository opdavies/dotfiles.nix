{ pkgs, ... }: {
  fonts = {
    monospace = {
      name = "MesloLGM Nerd Font Mono";
      # fc-list : family | sort | grep "Nerd Font"

      package = pkgs.nerdfonts.override { fonts = [ "Meslo" ]; };
      size = "14";
    };
  };
}
