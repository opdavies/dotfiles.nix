{ config, lib, pkgs, ... }: {
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  services.swayidle = {
    enable = true;

    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock --daemonize --image ~/.config/wallpaper/wallpaper.jpg";
      }
    ];
  };

  services.swayidle.timeouts = [
    {
      timeout = 300;
      command = "${pkgs.swaylock}/bin/swaylock --daemonize --image ~/.config/wallpaper/wallpaper.jpg";
    }

    {
      timeout = 600;
      command = "swaymsg 'output * dpms off'";
      resumeCommand = "swaymsg 'output * dpms on'";
    }
  ];

  programs.swaylock = {
    enable = true;

    settings = {
      daemonize = true;
      image = "~/.config/wallpaper/wallpaper.jpg";
    };
  };

  wayland.windowManager.sway = {
    enable = true;

    config = {
      assigns = {
        "1" = [{ app_id = "firefox"; }];
        "2" = [{ app_id = "Alacritty"; }];
        "3" = [{ class = "vlc"; }];
        "10" = [
          { class = "Slack"; }
          { class = "discord"; }
        ];
        # Get app_id with swaymsg -t get_tree
      };

      bars = [
        {
          colors = {
            background = "#323232";
            focusedWorkspace = {
              background = "#ffffff";
              border = "#ffffff";
              text = "#333333";
            };
            statusline = "#ffffff";
          };

          fonts = {
            names = [ "DejaVu Sans Mono" ];
            size = 16.0;
          };

          statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
          trayPadding = 10;
        }
      ];

      gaps = {
        inner = 10;
        smartBorders = "on";
        smartGaps = true;
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
        let modifier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${modifier}+Escape" = "exec swaylock --daemonize";
          "${modifier}+Shift+b" = "exec firefox";
          "${modifier}+tab" = "workspace back_and_forth";
        };

      menu = "wofi --show run";
      modifier = "Mod4";

      output = {
        "*" = {
          bg = "~/.config/wallpaper/wallpaper.jpg fill";
        };

        eDP-1 = {
          scale = "1.0";
        };
      };

      terminal = "alacritty";

      window.border = 3;
    };

    extraConfig = ''
      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable

      bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
      bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+

      for_window [class="vlc"] inhibit_idle fullscreen
    '';
  };

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
          {
            block = "cpu";
          }
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
            format = " $timestamp.datetime(f:'%F %T') ";
          }
        ];

        settings = {
          theme = {
            theme = "plain";
            overrides = {
              good_bg = "#333333";
              good_fg = "#ffffff";
              idle_bg = "#333333";
              idle_fg = "#ffffff";
              info_bg = "#333333";
              info_fg = "#ffffff";
              separator_bg = "#333333";
              warning_bg = "#333333";
              warning_fg = "#ffffff";
            };
          };
        };
      };
    };
  };
}
