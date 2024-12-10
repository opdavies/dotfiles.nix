{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.features.desktop.slack.enable = mkEnableOption "Enable Slack";

  config = mkIf config.features.desktop.slack.enable {
    home.packages = with pkgs; [ slack ];
  };
}
