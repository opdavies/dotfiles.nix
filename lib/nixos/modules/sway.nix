{ inputs, username, ... }:
{ pkgs, ... }: {
  services = {
    xserver = {
      displayManager = {
        defaultSession = "sway";
        sddm.enable = true;
      };
    };
  };

  programs.sway.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
  };

  home-manager.users.${username} = { pkgs, ... }: {
    home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_USE_XINPUT2 = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
      XDG_SESSION_TYPE = "wayland";
    };

    home.packages = with pkgs; [ i3status wl-clipboard wofi ];
  };
}
