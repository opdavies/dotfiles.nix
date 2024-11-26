{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.gaming.enable = lib.mkEnableOption "Enable games";

  config = lib.mkIf config.features.desktop.gaming.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [ zeroad ];
  };
}
