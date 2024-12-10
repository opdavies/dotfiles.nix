{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.media.handbrake.enable = mkEnableOption "Enable handbrake";

  config = mkIf config.features.desktop.media.handbrake.enable {
    home.packages = with pkgs; [ handbrake ];
  };
}
