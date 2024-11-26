{
  config,
  lib,
  pkgs,
  username,
  ...
}:

{
  options.features.desktop.screenkey.enable = lib.mkEnableOption "Enable screenkey";

  config = lib.mkIf config.features.desktop.screenkey.enable {
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
