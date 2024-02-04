{ config, inputs, self, username, pkgs, ... }:

let
  modifier = "Mod4";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      assigns = {
        "7" = [{ class = "vlc"; }];
        "8" = [{ class = "0ad"; }];
        "9" = [
          { class = "Slack"; }
          { class = "discord"; }
        ];
      };

      focus.followMouse = false;

      modifier = modifier;

      keybindings = inputs.nixpkgs.lib.mkOptionDefault {
        "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run -sb '#555555'";

        "${modifier}+Shift+b" = "exec ${pkgs.firefox-devedition}/bin/firefox-devedition";
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

        "${modifier}+Shift+s" = "exec --no-startup-id feh --randomize --bg-scale /home/${username}/Pictures/Wallpaper/*;";
        "${modifier}+Shift+p" = "exec flameshot gui";
        "${modifier}+Shift+y" = "exec copyq toggle";

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

      exec_always --no-startup-id i3-auto-layout
      exec --no-startup-id ${pkgs.feh}/bin/feh --randomize --bg-scale /home/${username}/Pictures/Wallpaper/*;

      default_border none
      default_floating_border none
      smart_borders on
      smart_gaps on

                              #border backgr  text    indicator
      client.focused          #444444 #555555 #ffffff #dddddd
      client.focused_inactive #222222 #333333 #888888 #292d2e
      client.unfocused        #222222 #111111 #888888 #292d2e
      client.urgent           #2f343a #900000 #ffffff #900000

    '';

    config = {
      bars = [{
        position = "bottom";
        statusCommand = "${pkgs.i3status}/bin/i3status";
        colors = {
          background = "#161616";
          statusline = "#ffffff";
          separator = "#333333";

          focusedWorkspace = {
            background = "#444444";
            border = "#555555";
            text = "#ffffff";
          };

          activeWorkspace = {
            background = "#555555";
            border = "#666666";
            text = "#ffffff";
          };

          inactiveWorkspace = {
            background = "#111111";
            border = "#000000";
            text = "#888888";
          };

          bindingMode = {
            background = "#ff0000";
            border = "#880000";
            text = "#ffffff";
          };

          urgentWorkspace = {
            background = "#ff0000";
            border = "#880000";
            text = "#ffffff";
          };
        };
      }];

      fonts = { names = [ "GeistMono" ]; };

      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
    };
  };

  programs.i3status = {
    enable = true;

    general = {
      colors = true;

      color_bad = "#f7768e";
      color_degraded = "#ff9e64";
      color_good = "#c0caf5";
    };

    modules = {
      cpu_temperature.enable = false;
      ipv6.enable = false;
      load.enable = false;
    };
  };
}
