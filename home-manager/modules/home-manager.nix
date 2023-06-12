{ config, pkgs, ... }: {
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

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
      };
    };
  };
}
