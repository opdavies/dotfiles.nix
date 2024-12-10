{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.gaming.enable = mkEnableOption "Enable games";

  config = mkIf config.features.desktop.gaming.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [ zeroad ];
  };
}
