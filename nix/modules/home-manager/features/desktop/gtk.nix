{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.desktop.gtk.enable = lib.mkEnableOption "Enable gtk";

  config = lib.mkIf config.features.desktop.gtk.enable {
    gtk = {
      enable = true;

      theme = {
        name = "Arc-Dark";
        package = pkgs.arc-theme;
      };

      iconTheme = {
        name = "Arc";
        package = pkgs.arc-icon-theme;
      };
    };
  };
}
