{ config, lib, ... }:

with lib;

{
  options.features.cli.direnv.enable = mkEnableOption "Enable direnv";

  config = mkIf config.features.cli.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
