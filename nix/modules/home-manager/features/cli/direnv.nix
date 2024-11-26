{ config, lib, ... }:

{
  options.features.cli.direnv.enable = lib.mkEnableOption "Enable direnv";

  config = lib.mkIf config.features.cli.direnv.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
