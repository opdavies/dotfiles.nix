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
            trigger = ":archive";
            replace = "${baseUrl}/archive";
          }
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
          {
            trigger = ":daily";
            replace = "${baseUrl}/daily";
          }
          {
            trigger = ":dotfiles";
            replace = "https://github.com/opdavies/dotfiles";
          }
          {
            trigger = ":dc";
            replace = "Drupal Commerce";
          }
          {
            trigger = ":dr";
            replace = "Drupal";
          }
          {
            trigger = ":gt";
            replace = "Great, thanks!";
          }
          {
            trigger = ":lh";
            replace = "http://localhost";
          }
          {
            trigger = ":talks";
            replace = "${baseUrl}/talks";
          }
          {
            trigger = ":website";
            replace = "${baseUrl}";
          }
        ];
      };
    };
  };
}
