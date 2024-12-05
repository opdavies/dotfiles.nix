{
  features = {
    cli = {
      docker.enable = true;
    };

    desktop = {
      gaming.enable = true;
      peek.enable = true;
    };

    homelab = {
      gitea.enable = true;
      immich.enable = true;
      jellyfin.enable = true;
    };
  };

  imports = [ ./configuration.nix ];
}
