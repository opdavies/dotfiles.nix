{
  config,
  lib,
  pkgs,
  username,
  ...
}:

with lib;

{
  options.features.desktop.screenkey.enable = mkEnableOption "Enable screenkey";

  config = mkIf config.features.desktop.screenkey.enable {
    environment.systemPackages = with pkgs; [ screenkey ];

    home-manager.users.${username}.xdg.configFile."screenkey.json".text = builtins.toJSON {
      key_mode = "composed";
      mods_mode = "emacs";
      persist = true;
      size = "small";
      timeout = 0.25;
    };
  };
}
