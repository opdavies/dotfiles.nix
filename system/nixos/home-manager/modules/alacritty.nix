{
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      window.padding = {
        x = 15;
        y = 15;
      };

      font = {
        size = 12.0;

        bold.style = "Regular";
        normal.family = "GeistMono Nerd Font Mono";
        # fc-list : family | sort | grep "Nerd Font"

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = {program = "zsh";};
    };
  };
}
