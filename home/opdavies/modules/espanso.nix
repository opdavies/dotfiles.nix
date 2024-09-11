{
  services.espanso = {
    enable = true;

    configs = {
      default = {
        show_notifications = false;
      };
    };

    matches = {
      base = import ./espanso/matches.nix;
    };
  };
}
