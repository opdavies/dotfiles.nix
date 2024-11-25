{ self, ... }:
{
  home.sessionPath = [ "$HOME/bin" ];

  home.file."bin" = {
    source = "${self}/bin";
    recursive = true;
  };
}
