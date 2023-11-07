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
        size = 16.0;

        bold.style = "Regular";
        bolditalic.style = "Regular";
        italic.style = "Regular";
        normal.family = "AnonymicePro Nerd Font Mono";

        offset.y = 12;
        glyph_offset.y = 6;
      };

      shell = { program = "zsh"; };
    };
  };
}
