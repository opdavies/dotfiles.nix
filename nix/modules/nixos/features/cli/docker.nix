{ lib, config, ... }:

{
  options.features.cli.docker.enable = lib.mkEnableOption "Enable Docker";

  config = lib.mkIf config.features.cli.docker.enable {
    virtualisation.docker = {
      enable = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };
}
