{ config, inputs, self, ... }:

let
  modifier = "Mod4";
in
{
  home.file.".background-image".source = ../../../../config/wallpaper/wallpaper.jpg;

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

        # Change focus.
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";

        # Move focused window.
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        "XF86AudioRaiseVolume" = "exec pamixer -ui 2 && pamixer --get-volume";
        "XF86AudioLowerVolume" = "exec pamixer -ud 2 && pamixer --get-volume";
        "XF86AudioMute" = "exec pamixer --toggle-mute && ( [ \"$(pamixer --get-mute)\" = \"true\" ] && echo 0";

        "XF86MonBrightnessDown" = "exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p'";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p'";
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
