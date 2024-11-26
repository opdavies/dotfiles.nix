{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.slack.enable = lib.mkEnableOption "Enable Slack";

  config = lib.mkIf config.features.desktop.slack.enable {
    home.packages = with pkgs; [ slack ];
  };
}
