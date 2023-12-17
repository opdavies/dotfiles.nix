{ inputs, pkgs, username, self }:

{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ./modules/neovim.nix { inherit inputs pkgs self; })
    ./modules/git.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  programs.bat.enable = true;

  home.file."logo.txt" = {
    source = pkgs.copyPathToStore "${self}/logo.txt";
    target = "logo.txt";
  };

  programs.nnn.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.sessionPath = [ "$HOME/.config/bin" ];

  programs.ripgrep = {
    enable = true;

    arguments = [
      "--follow"
      "--hidden"
      "--smart-case"
    ];
  };

  xdg.configFile.bin = {
    source = ../../bin;
    recursive = true;
  };

  xdg.configFile.phpactor = {
    source = ../../config/phpactor;
    recursive = true;
  };
}
