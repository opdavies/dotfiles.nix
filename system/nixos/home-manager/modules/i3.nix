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
        laptop = {
          config.eDP-1 = {
            enable = true;
            mode = "1920x1080";
            primary = true;
            rate = "59.95";
          };

          config.HDMI-1.enable = false;

          fingerprint.HDMI-1 = "00ffffffffffff004c2d1710424e58432b1f0103803f24782ac8b5ad50449e250f5054bfef80714f810081c081809500a9c0b300010108e80030f2705a80b0588a0078682100001e000000fd00324b1e873c000a202020202020000000fc004c5532385235350a2020202020000000ff0048345a524130303132380a20200183020335f04961120313041f10605f2309070783010000e305c0006b030c002000b83c2000200167d85dc401788003e20f81e3060501023a801871382d40582c450078682100001e023a80d072382d40102c458078682100001e04740030f2705a80b0588a0078682100001e565e00a0a0a029503020350078682100001a000049";
          fingerprint.eDP-1 = "00ffffffffffff000daef21400000000161c0104a51f117802ee95a3544c99260f505400000001010101010101010101010101010101363680a0703820402e1e240035ad10000018000000fe004e3134304843472d4751320a20000000fe00434d4e0a202020202020202020000000fe004e3134304843472d4751320a2000bb";
        };

        desktop = {
          config.eDP-1.enable = false;

          config.HDMI-1 = {
            enable = true;
            mode = "2560x1440";
            primary = true;
            rate = "59.95";
          };

          fingerprint.HDMI-1 = "00ffffffffffff004c2d1710424e58432b1f0103803f24782ac8b5ad50449e250f5054bfef80714f810081c081809500a9c0b300010108e80030f2705a80b0588a0078682100001e000000fd00324b1e873c000a202020202020000000fc004c5532385235350a2020202020000000ff0048345a524130303132380a20200183020335f04961120313041f10605f2309070783010000e305c0006b030c002000b83c2000200167d85dc401788003e20f81e3060501023a801871382d40582c450078682100001e023a80d072382d40102c458078682100001e04740030f2705a80b0588a0078682100001e565e00a0a0a029503020350078682100001a000049";
          fingerprint.eDP-1 = "00ffffffffffff000daef21400000000161c0104a51f117802ee95a3544c99260f505400000001010101010101010101010101010101363680a0703820402e1e240035ad10000018000000fe004e3134304843472d4751320a20000000fe00434d4e0a202020202020202020000000fe004e3134304843472d4751320a2000bb";
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
