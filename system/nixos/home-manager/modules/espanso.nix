let
  baseUrl = "https://www.oliverdavies.dev";
in
  {
  services.espanso = {
    enable = true;

    configs = {
      default = {
        show_notifications = false;
      };
    };

    matches = {
      base = {
        matches = [
          {
            trigger = ":atdc";
            replace = "${baseUrl}/atdc";
          }
          {
            trigger = ":call";
            replace = "${baseUrl}/call";
          }
          {
            trigger = ":coaching";
            replace = "${baseUrl}/team-coaching";
          }
        ];
      };
    };
  };
}
