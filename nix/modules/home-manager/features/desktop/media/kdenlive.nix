{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.media.kdenlive.enable = lib.mkEnableOption "Enable kdenlive";

  config = lib.mkIf config.features.desktop.media.kdenlive.enable {
    home.packages = with pkgs; [ kdenlive ];
  };
}
