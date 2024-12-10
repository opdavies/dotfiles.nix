{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.media.gimp.enable = mkEnableOption "Enable gimp";

  config = mkIf config.features.desktop.media.gimp.enable {
    home.packages = with pkgs; [ gimp ];
  };
}
