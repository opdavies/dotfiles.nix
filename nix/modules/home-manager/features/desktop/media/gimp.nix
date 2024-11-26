{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.media.gimp.enable = lib.mkEnableOption "Enable gimp";

  config = lib.mkIf config.features.desktop.media.gimp.enable {
    home.packages = with pkgs; [ gimp ];
  };
}
