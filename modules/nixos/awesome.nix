{ self, username, ... }:
{
  services.xserver = {
    displayManager.lightdm.enable = true;

    windowManager.awesome = {
      enable = true;
      noArgb = true;
    };
  };

  home-manager.users.${username} = {
    xdg.configFile.awesome = {
      source = "${self}/config/awesome";
      recursive = true;
    };
  };
}
