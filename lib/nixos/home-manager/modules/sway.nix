{
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs.i3status-rust = {
    enable = true;

    bars = {
      default = {
        blocks = [
          {
            block = "net";
            format = " $ip ";
          }
          {
            block = "battery";
            format = " $icon $percentage $time ";
          }
          { block = "cpu"; }
          {
            block = "memory";
            format = " $icon $mem_total_used_percents.eng(w:2) ";
            format_alt = " $icon_swap $swap_used_percents.eng(w:2) ";
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            alert_unit = "GB";
            interval = 20;
            warning = 20.0;
            alert = 10.0;
            format = " $icon $available.eng(w:2) ";
          }
          {
            block = "time";
            interval = 1;
            format = " $timestamp.datetime(f:'%d-%m-%Y %T') ";
          }
        ];

        settings = {
          theme = {
            theme = "plain";
            overrides = {
              critical_bg = "#111111";
              good_bg = "#111111";
              good_fg = "#ffffff";
              idle_bg = "#111111";
              idle_fg = "#ffffff";
              info_bg = "#111111";
              info_fg = "#ffffff";
              separator_bg = "#111111";
              warning_bg = "#111111";
              warning_fg = "#ffffff";
            };
          };
        };
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    xwayland = true;

    config = {
      bars = [
        {
          colors.background = "#111111";

          fonts = {
            names = [ "JetBrainsMono Nerd Font Mono" ];
            size = 12.0;
          };

          statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
          trayPadding = 5;
        }
      ];

      defaultWorkspace = "workspace number 1";

      gaps = {
        inner = 0;
        smartBorders = "on";
      };

      input = {
        "*" = {
          xkb_layout = "gb";
        };

        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
        };
      };

      keybindings =
        let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in
        inputs.nixpkgs.lib.mkOptionDefault {
          "${modifier}+Escape" = "exec swaylock --daemonize";
          "${modifier}+Shift+b" = "exec ${pkgs.firefox}/bin/firefox";
          "${modifier}+Shift+f" = "exec ${pkgs.xfce.thunar}/bin/thunar";
          "${modifier}+Shift+period" = "exec systemctl suspend";
          "${modifier}+Shift+s" = "exec ${pkgs.flameshot}/bin/flameshot gui";
          "${modifier}+Shift+y" = "exec ${pkgs.copyq}/bin/copyq toggle";
        };

      menu = "wofi --show run";
      modifier = "Mod4";

      output = {
        # "*" = {
        #   bg = "~/.config/wallpaper/wallpaper.jpg fill";
        # };

        eDP-1 = {
          scale = "1.0";
        };
      };

      terminal = "wezterm";

      window.border = 3;
    };

    extraConfig = ''
      exec_always ${pkgs.kanshi}/bin/kanshi

      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable

      set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob

      bindsym XF86AudioRaiseVolume exec pamixer -ui 2 && pamixer --get-volume > $WOBSOCK
      bindsym XF86AudioLowerVolume exec pamixer -ud 2 && pamixer --get-volume > $WOBSOCK
      bindsym XF86AudioMute exec pamixer --toggle-mute && ( [ "$(pamixer --get-mute)" = "true" ] && echo 0 > $WOBSOCK ) || pamixer --get-volume > $WOBSOCK

      # TODO: light?
      bindsym XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
      bindsym XF86MonBrightnessUp exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK

      for_window [app_id="flameshot"] floating enable
      for_window [app_id="pavucontrol"] floating enable
      for_window [class="copyq"] floating enable
      for_window [class="zoom"] floating enable
      # swaymsg -t get_tree

      seat seat0 hide_cursor 1000
      seat seat0 hide_cursor when-typing enable
    '';
  };
}
