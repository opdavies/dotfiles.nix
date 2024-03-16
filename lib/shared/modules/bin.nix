{
  home.sessionPath = ["$HOME/.config/bin"];

  xdg.configFile.bin = {
    source = ../../../bin;
    recursive = true;
  };
}
