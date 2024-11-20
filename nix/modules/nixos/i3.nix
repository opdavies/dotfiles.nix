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
    dunst
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

        defaultWorkspace = "workspace number 1";

        focus.followMouse = false;

        modifier = modifier;

        keybindings = inputs.nixpkgs.lib.mkOptionDefault {
          "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

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

        window = {
          border = 0;
          hideEdgeBorders = "none";
        };
      };

      extraConfig = ''
        set $laptop eDP-1
        bindswitch --reload --locked lid:on output $laptop disable
        bindswitch --reload --locked lid:off output $laptop enable

        exec_always --no-startup-id ${pkgs.nitrogen}/bin/nitrogen --restore &
        exec_always --no-startup-id caffeine

        default_border none
        default_floating_border none
        smart_borders on
        smart_gaps on

        for_window [class="zoom"] floating enable
        # xprop | grep -i class
      '';

      config = {
        bars = [
          {
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
  };
}
