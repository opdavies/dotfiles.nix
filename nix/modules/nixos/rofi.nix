{ pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    rofi-power-menu
  ];

  home-manager.users.${username}.programs.rofi = {
    enable = true;
    cycle = true;
    theme = "Arc-Dark";

    extraConfig = {
      modi = "run,drun,emoji,calc";
    };

    plugins = with pkgs; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-pulse-select
    ];
  };
}
