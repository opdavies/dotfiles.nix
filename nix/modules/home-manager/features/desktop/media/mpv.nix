{ config, lib, ... }:

{
  options.features.desktop.media.mpv.enable = lib.mkEnableOption "Enable mpv media player";

  config = lib.mkIf config.features.desktop.media.mpv.enable {
    programs.mpv = {
      enable = true;

      # https://github.com/mpv-player/mpv/blob/master/etc/input.conf
      bindings = {
        "DOWN" = "add volume -5";
        "UP" = "add volume 5";
      };
    };
  };
}
