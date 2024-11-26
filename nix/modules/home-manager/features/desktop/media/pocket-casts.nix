{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.media.pocket-casts.enable = lib.mkEnableOption "Enable Pocket Casts";

  config = lib.mkIf config.features.desktop.media.pocket-casts.enable {
    home.packages = with pkgs; [ pocket-casts ];
  };
}
