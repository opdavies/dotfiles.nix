{
  systemd.user.services.kanshi = {
    serviceConfig = {
      StartLimitBurst = 5;
      StartLimitIntervalSec = 30;
    };
  };

  services.kanshi = {
    enable = true;

    # swaymsg -t get_outputs
    profiles = {
      undocked = {
        outputs = [{
          criteria = "eDP-1";
          status = "enable";
          mode = "1920x1080";
          position = "0,0";
        }];
      };

      docked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }

          {
            criteria = "Samsung Electric Company LU28R55 H4ZRA00128";
            mode = "3840x2160";
            position = "0,0";
          }
        ];
      };
    };
  };
}
