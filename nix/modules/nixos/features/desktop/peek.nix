{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.peek.enable = lib.mkEnableOption "Enable peek";

  config = lib.mkIf config.features.desktop.peek.enable {
    environment.systemPackages = with pkgs; [ peek ];
  };
}
