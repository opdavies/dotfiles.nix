{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.media.pocket-casts.enable = mkEnableOption "Enable Pocket Casts";

  config = mkIf config.features.desktop.media.pocket-casts.enable {
    home.packages = with pkgs; [ pocket-casts ];
  };
}
