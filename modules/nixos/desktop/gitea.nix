{
  services.gitea = {
    enable = true;

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
