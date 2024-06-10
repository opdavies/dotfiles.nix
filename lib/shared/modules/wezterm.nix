{ pkgs, self, ... }:
let
  theme = import "${self}/lib/theme" { inherit pkgs; };
in
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;

    extraConfig = ''
      return {
        font = wezterm.font "${theme.fonts.monospace.name}",
        -- TODO: use theme.fonts.monospace.size
        font_size = 14.0,
        hide_tab_bar_if_only_one_tab = true,
        line_height = 1.5,
        window_padding = {
          bottom = 10,
          left = 10,
          right = 10,
          top = 10,
        }
      }
    '';
  };
}
