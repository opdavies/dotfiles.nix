{ pkgs, ... }: {
  fonts = {
    monospace = {
      name = "JetBrainsMono Nerd Font Mono";
      # fc-list : family | sort | grep "Nerd Font"

      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      size = "8";
    };
  };
}
