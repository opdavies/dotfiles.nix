{ config, lib, ... }:

{
  options.features.desktop.espanso.enable = lib.mkEnableOption "Enable espanso";

  config = lib.mkIf config.features.desktop.espanso.enable {
    services.espanso = {
      enable = true;

      configs = {
        default = {
          show_notifications = false;
          toggle_key = "LEFT_ALT";
        };
      };

      matches = {
        base = import ./espanso/matches/base.nix { inherit lib; };
      };
    };
  };
}
