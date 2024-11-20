{ self, ... }:
{
  home.sessionPath = [ "$HOME/.local/bin" ];

  home.file.".local/bin" = {
    source = "${self}/nix/bin";
    recursive = true;
  };
}
