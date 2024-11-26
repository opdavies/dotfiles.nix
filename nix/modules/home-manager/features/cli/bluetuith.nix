{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.features.cli.bluetuith.enable = lib.mkEnableOption "Enable bluetuith";

  config = lib.mkIf config.features.cli.bluetuith.enable {
    home.packages = with pkgs; [
      bluetuith
    ];

    xdg.configFile."bluetuith/bluetuith.conf" = {
      text = ''
        {
          adapter: ""
          adapter-states: ""
          connect-bdaddr: ""
          gsm-apn: ""
          gsm-number: ""
          keybindings: {
            NavigateDown: j
            NavigateUp: k
          }
          receive-dir: ""
          theme: {}
        }
      '';
    };
  };
}
