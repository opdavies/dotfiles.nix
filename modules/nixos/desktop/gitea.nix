{ pkgs, ... }:

{
  services.gitea = {
    enable = true;
    package = pkgs.unstable.gitea;

    settings = {
      server = {
        HTTP_PORT = 2222;
      };

      service = {
        DISABLE_REGISTRATION = true;
      };
    };
  };
}
