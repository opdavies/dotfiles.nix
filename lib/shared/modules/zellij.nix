{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    simplified_ui true
    theme "catppuccin-mocha"
  '';
}
