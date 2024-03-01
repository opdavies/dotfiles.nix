{
  inputs,
  username,
}: {
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ./modules/neovim.nix {inherit inputs;})
    ./modules/git.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat.enable = true;

  programs.lsd.enable = true;

  programs.nnn.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.sessionPath = ["$HOME/.config/bin"];

  xdg.configFile."ripgrep/config".text = ''
    --follow
    --smart-case
  '';

  xdg.configFile.bin = {
    source = ../../bin;
    recursive = true;
  };

  xdg.configFile.phpactor = {
    source = ../../config/phpactor;
    recursive = true;
  };
}
