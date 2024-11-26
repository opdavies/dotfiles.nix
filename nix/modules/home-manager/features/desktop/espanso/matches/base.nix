{ lib, ... }:

let
  inherit (lib) removePrefix;

  websiteUrl = "https://www.oliverdavies.uk";
  dailyUrl = "https://dailydrupaler.com";
  githubUrl = "https://github.com/opdavies";
  podcastUrl = "https://beyondblockspodcast.com";
in
{
  matches = [
    {
      trigger = ":email";
      replace = "oliver@${removePrefix "https://www." websiteUrl}";
    }
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
      trigger = ":dot";
      replace = "${githubUrl}/dotfiles";
    }
    {
      trigger = ":gh";
      replace = "${githubUrl}";
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
      trigger = ":record";
      replace = "https://savvycal.com/opdavies/beyond-blocks";
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
