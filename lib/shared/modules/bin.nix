{self, ...}: {
  home.sessionPath = ["$HOME/.config/bin"];

  xdg.configFile.bin = {
    source = "${self}/bin";
    recursive = true;
  };
}
