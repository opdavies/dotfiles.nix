{ lib, config, ... }:

with lib;

{
  options.features.cli.docker.enable = mkEnableOption "Enable Docker";

  config = mkIf config.features.cli.docker.enable {
    virtualisation.docker = {
      enable = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };
}
