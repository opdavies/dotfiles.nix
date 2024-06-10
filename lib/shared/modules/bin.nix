{ self, ... }:
{
  home.sessionPath = [ "$HOME/.local/bin" ];

  home.file.".local/bin" = {
    source = "${self}/bin";
    recursive = true;
  };
}
