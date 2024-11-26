{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.discord.enable = lib.mkEnableOption "Enable Discord";

  config = lib.mkIf config.features.desktop.discord.enable {
    home.packages = with pkgs; [ discord ];
  };
}
