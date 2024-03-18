{ pkgs, ... }: {
  home.packages = with pkgs; [ ripgrep ];

  xdg.configFile."ripgrep/config".text = ''
    --follow
    --smart-case
  '';
}
