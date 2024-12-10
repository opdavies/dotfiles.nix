{
  config,
  lib,
  username,
  ...
}:

with lib;

{
  options.features.desktop.flameshot.enable = mkEnableOption "Enable flameshot";

  config = mkIf config.features.desktop.flameshot.enable {
    services.flameshot = {
      enable = true;

      settings = {
        General = {
          disabledTrayIcon = false;
          saveAfterCopy = true;
          savePath = "/home/${username}/Pictures/Screenshots";
          showHelp = false;
          uiColor = "#60a5fa";
        };
      };
    };
  };
}
