{ config, lib, ... }:

with lib;

{
  options.features.desktop.copyq.enable = mkEnableOption "Enable copyq";

  config = mkIf config.features.desktop.copyq.enable {
    services.copyq.enable = true;
  };
}
