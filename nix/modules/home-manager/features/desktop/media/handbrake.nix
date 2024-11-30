{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.media.handbrake.enable = lib.mkEnableOption "Enable handbrake";

  config = lib.mkIf config.features.desktop.media.handbrake.enable {
    home.packages = with pkgs; [ handbrake ];
  };
}
