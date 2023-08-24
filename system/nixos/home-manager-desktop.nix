{ config, inputs, pkgs }:

{
  nixpkgs = {
    config.allowUnfreePredicate = pkg:
      builtins.elem (inputs.lib.getName pkg) [ "postman" ];
  };

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
        "9" = [
          { class = "Slack"; }
          { class = "discord"; }
        ];
        # Get app_id with swaymsg -t get_tree
      };

      bars = [
        {
          colors = {
            background = "#222222";
            focusedWorkspace = {
              background = "#ffffff";
              border = "#ffffff";
              text = "#333333";
            };
            statusline = "#ffffff";
          };

          fonts = {
            names = [ "Fira Code Nerd Font Mono" ];
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
        in inputs.nixpkgs.lib.mkOptionDefault {
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

      set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob

      bindsym XF86AudioRaiseVolume exec pamixer -ui 2 && pamixer --get-volume > $WOBSOCK
      bindsym XF86AudioLowerVolume exec pamixer -ud 2 && pamixer --get-volume > $WOBSOCK
      bindsym XF86AudioMute exec pamixer --toggle-mute && ( [ "$(pamixer --get-mute)" = "true" ] && echo 0 > $WOBSOCK ) || pamixer --get-volume > $WOBSOCK

      bindsym XF86MonBrightnessDown exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK
      bindsym XF86MonBrightnessUp exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK

      exec alacritty
      exec firefox

      for_window [class="vlc"] inhibit_idle fullscreen

      for_window [app_id="zoom"] floating enable
      for_window [app_id="zoom" title="Choose ONE of the audio conference options"] floating enable
      for_window [app_id="firefox" title="Firefox — Sharing Indicator"] floating enable
      for_window [app_id="zoom" title="zoom"] floating enable
      for_window [app_id="zoom" title="Zoom Meeting"] floating disable
      for_window [app_id="zoom" title="Zoom - Free Account"] floating disable
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
              critical_bg = "#222222";
              good_bg = "#222222";
              good_fg = "#ffffff";
              idle_bg = "#222222";
              idle_fg = "#ffffff";
              info_bg = "#222222";
              info_fg = "#ffffff";
              separator_bg = "#222222";
              warning_bg = "#222222";
              warning_fg = "#ffffff";
            };
          };
        };
      };
    };
  };

  xdg.configFile.wallpaper = {
    source = ../../config/wallpaper;
    recursive = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = 14.0;

        bold.style = "Regular";
        bolditalic.style = "Regular";
        italic.style = "Regular";
        normal.family = "Fira Code Nerd Font Mono";

        offset.y = 14;
        glyph_offset.y = 8;
      };

      shell = { program = "zsh"; };
    };
  };
}
