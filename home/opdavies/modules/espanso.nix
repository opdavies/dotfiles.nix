{
  services.espanso = {
    enable = true;

    configs = {
      default = {
        show_notifications = false;
        toggle_key = "LEFT_ALT";
      };
    };

    matches = {
      base = import ./espanso/matches.nix;
    };
  };
}
