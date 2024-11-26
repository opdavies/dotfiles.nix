{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.zoom.enable = lib.mkEnableOption "Enable zoom";

  config = lib.mkIf config.features.desktop.zoom.enable {
    home.packages = with pkgs; [ nixpkgs-2405.zoom-us ];
  };
}
