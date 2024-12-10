{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.media.kdenlive.enable = mkEnableOption "Enable kdenlive";

  config = mkIf config.features.desktop.media.kdenlive.enable {
    home.packages = with pkgs; [ kdenlive ];
  };
}
