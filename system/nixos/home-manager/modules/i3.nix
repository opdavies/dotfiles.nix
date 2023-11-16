{ config, inputs, self, ... }:

let
  modifier = "Mod4";
in
{
  home.file.".background-image".source = ../../../../config/wallpaper/wallpaper.jpg;

  services.autorandr.enable = true;

  programs.autorandr = {
    enable = true;

    profiles = {
      default = {
        # config = {
        #   "eDP-1" = {
        #     dpi = 96;
        #     enable = true;
        #     mode = "1920x1080";
        #     primary = true;
        #     rate = "60";
        #   };
        # };
      };
    };
  };

  xsession.windowManager.i3 = {
    enable = true;

    config = {
      assigns = {
        "1" = [{ class = "firefox"; }];
        "2" = [{ class = "Alacritty"; }];
        "3" = [{ class = "vlc"; }];
        "9" = [
          { class = "Slack"; }
          { class = "discord"; }
        ];
      };

      modifier = modifier;

      keybindings = inputs.nixpkgs.lib.mkOptionDefault {
        "${modifier}+Shift+b" = "exec firefox";
        "${modifier}+Tab" = "workspace back_and_forth";
      };

      terminal = "alacritty";

      window = {
        border = 0;
        hideEdgeBorders = "none";
      };
    };

    extraConfig = ''
      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable

      default_border none
      default_floating_border none
      smart_borders on
      smart_gaps on
    '';
  };
}
