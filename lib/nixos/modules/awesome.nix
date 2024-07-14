{
  pkgs,
  self,
  username,
  ...
}:

let
  inherit (pkgs) writeShellApplication;

  script-autostart = writeShellApplication {
    name = "awesome-autostart";
    text = ''
      set -o errexit

      ${pkgs.nitrogen}/bin/nitrogen --set-zoom-fill --random "''${HOME}/Pictures/Wallpaper"
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    script-autostart

    nitrogen
  ];

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
