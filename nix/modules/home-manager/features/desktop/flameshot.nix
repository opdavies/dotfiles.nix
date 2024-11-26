{
  config,
  lib,
  username,
  ...
}:

{
  options.features.desktop.flameshot.enable = lib.mkEnableOption "Enable flameshot";

  config = lib.mkIf config.features.desktop.flameshot.enable {
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
