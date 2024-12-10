{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.peek.enable = mkEnableOption "Enable peek";

  config = mkIf config.features.desktop.peek.enable {
    environment.systemPackages = with pkgs; [ peek ];
  };
}
