{ config, lib, ... }:

{
  options.features.desktop.copyq.enable = lib.mkEnableOption "Enable copyq";

  config = lib.mkIf config.features.desktop.copyq.enable {
    services.copyq.enable = true;
  };
}
