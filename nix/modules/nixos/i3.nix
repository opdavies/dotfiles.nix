{
  inputs,
  pkgs,
  self,
  username,
  ...
}:

let
  theme = import "${self}/nix/lib/theme" { inherit pkgs; };

  modifier = "Mod4";
in
{
  services = {
    cron = {
      enable = true;

      systemCronJobs = [
        "* * * * * opdavies ${pkgs.notify-battery}/bin/notify-battery"
      ];
    };

    displayManager.defaultSession = "none+i3";

    xserver = {
      displayManager.lightdm.enable = true;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          i3status
          i3lock
          i3blocks
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    acpi
    libnotify
    nitrogen
  ];

  home-manager.users.${username} = {
    xsession.windowManager.i3 = {
      enable = true;

      config = {
        assigns = {
          "7" = [ { class = "vlc"; } ];
          "8" = [ { class = "0ad"; } ];
          "9" = [
            { class = "Slack"; }
            { class = "discord"; }
          ];
        };

        colors = {
          focused = {
            border = "#444444";
            background = "#555555";
            text = "#ffffff";
            indicator = "#dddddd";
            childBorder = "#444444";
          };

          focusedInactive = {
            border = "#222222";
            background = "#333333";
            text = "#888888";
            indicator = "#292d2e";
            childBorder = "#222222";
          };

          placeholder = {
            border = "#000000";
            background = "#0c0c0c";
            text = "#ffffff";
            indicator = "#000000";
            childBorder = "#0c0c0c";
          };

          unfocused = {
            border = "#222222";
            background = "#111111";
            text = "#888888";
            indicator = "#292d2e";
            childBorder = "#222222";
          };

          urgent = {
            border = "#2f343a";
            background = "#900000";
            text = "#ffffff";
            indicator = "#900000";
            childBorder = "#900000";
          };
        };

        defaultWorkspace = "workspace number 1";

        modifier = modifier;

        keybindings = inputs.nixpkgs.lib.mkOptionDefault {
          "${modifier}+d" = "exec rofi -show drun";

          "${modifier}+Shift+b" = "exec ${pkgs.firefox}/bin/firefox";
          "${modifier}+Shift+f" = "exec ${pkgs.xfce.thunar}/bin/thunar";

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

          "${modifier}+Shift+s" = "exec ${pkgs.flameshot}/bin/flameshot gui";
          "${modifier}+Shift+p" = "exec ${pkgs.autorandr}/bin/autorandr --change";
          "${modifier}+Shift+y" = "exec ${pkgs.copyq}/bin/copyq toggle";

          "XF86AudioRaiseVolume" = "exec pamixer -ui 2 && pamixer --get-volume";
          "XF86AudioLowerVolume" = "exec pamixer -ud 2 && pamixer --get-volume";
          "XF86AudioMute" = ''exec pamixer --toggle-mute && ( [ "$(pamixer --get-mute)" = "true" ] && echo 0'';

          "XF86MonBrightnessDown" = "exec brightnessctl set 5%- | sed -En 's/.*(([0-9]+)%).*/1/p'";
          "XF86MonBrightnessUp" = "exec brightnessctl set +5% | sed -En 's/.*(([0-9]+)%).*/1/p'";
        };

        terminal = "alacritty";
      };

      extraConfig = ''
        set $laptop eDP-1
        bindswitch --reload --locked lid:on output $laptop disable
        bindswitch --reload --locked lid:off output $laptop enable

        exec_always --no-startup-id ${pkgs.nitrogen}/bin/nitrogen --restore &
        exec_always --no-startup-id caffeine
        exec_always --no-startup-id ${pkgs.autorandr}/bin/autorandr --change

        smart_borders on
        smart_gaps on

        for_window [class="copyq"] floating enable
        for_window [class="zoom"] floating enable
        # xprop | grep -i class
      '';

      config = {
        bars = [
          {
            colors = {
              background = "#222222";
              separator = "#333333";
              statusline = "#ffffff";

              bindingMode = {
                background = "#900000";
                border = "#2f343a";
                text = "#ffffff";
              };

              focusedWorkspace = {
                background = "#555555";
                border = "#444444";
                text = "#ffffff";
              };

              inactiveWorkspace = {
                background = "#333333";
                border = "#222222";
                text = "#888888";
              };

              urgentWorkspace = {
                background = "#900000";
                border = "#2f343a";
                text = "#ffffff";
              };
            };

            position = "bottom";
            statusCommand = "${pkgs.i3status}/bin/i3status";
            trayOutput = "none";
          }
        ];

        fonts.names = [ "${theme.fonts.monospace.name}" ];

        gaps = {
          smartBorders = "on";
          smartGaps = true;
        };
      };
    };

    programs.i3status = {
      enable = true;

      general.colors = false;

      modules = {
        "battery all".settings.last_full_capacity = true;

        "tztime local".settings.format = "%d-%m-%Y %H:%M:%S";
        cpu_temperature.enable = false;
        ipv6.enable = false;
        load.enable = false;
      };
    };

    services.dunst = {
      enable = true;

      settings.global.follow = "keyboard";
    };
  };
}
