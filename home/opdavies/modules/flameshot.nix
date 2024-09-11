{ username, ... }:
{
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
}
