let
  websiteUrl = "https://www.oliverdavies.uk";
  dailyUrl = "https://dailydrupaler.com";
  podcastUrl = "https://beyondblockspodcast.com";
in
{
  matches = [
    {
      trigger = ":archive";
      replace = "${websiteUrl}/archive";
    }
    {
      trigger = ":atdc";
      replace = "${websiteUrl}/atdc";
    }
    {
      trigger = ":call";
      replace = "${websiteUrl}/call";
    }
    {
      trigger = ":coaching";
      replace = "${websiteUrl}/team-coaching";
    }
    {
      trigger = ":daily";
      replace = "${dailyUrl}";
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
      replace = "If you'd like to be a guest on ${podcastUrl} and talk about ..., I'd love to have you on the show.";
    }
    {
      trigger = ":lh";
      replace = "http://localhost";
    }
    {
      trigger = ":podcast";
      replace = "${podcastUrl}";
    }
    {
      trigger = ":pricing";
      replace = "${websiteUrl}/pricing";
    }
    {
      trigger = ":talks";
      replace = "${websiteUrl}/presentations";
    }
    {
      trigger = ":website";
      replace = "${websiteUrl}";
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
