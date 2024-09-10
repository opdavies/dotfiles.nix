{ baseUrl }:

{
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
      replace = "https://dailydrupaler.com";
    }
    {
      trigger = ":dotfiles";
      replace = "https://github.com/opdavies/dotfiles.nix";
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
      trigger = ":guest";
      replace = "If you'd like to be a guest on https://beyondblockspodcast.com and talk about ..., I'd love to have you on the show.";
    }
    {
      trigger = ":lh";
      replace = "http://localhost";
    }
    {
      trigger = ":podcast";
      replace = "https://beyondblockspodcast.com";
    }
    {
      trigger = ":pricing";
      replace = "${baseUrl}/pricing";
    }
    {
      trigger = ":talks";
      replace = "${baseUrl}/presentations";
    }
    {
      trigger = ":website";
      replace = "${baseUrl}";
    }
    {
      trigger = ":zet";
      replace = "https://zet.oliverdavies.uk";
    }
    {
      trigger = ":zoom";
      replace = "https://savvycal.com/opdavies/zoom";
    }
  ];
}
