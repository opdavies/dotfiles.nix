{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.discord.enable = mkEnableOption "Enable Discord";

  config = mkIf config.features.desktop.discord.enable {
    home.packages = with pkgs; [ discord ];
  };
}
