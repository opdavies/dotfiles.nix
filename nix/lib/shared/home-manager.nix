{
  inputs,
  pkgs,
  username,
  self,
}:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # Nicely reload system units when changing configs.
  systemd.user.startServices = "sd-switch";

  # See https://github.com/nix-community/home-manager/issues/2064#issuecomment-2259307514.
  # This is a workaround for the following errors that appeared when switching back to unstable:
  # - 1: Failed to start unit flameshot.service
  # - 2: org.freedesktop.systemd1.NoSuchUnit: Unit tray.target not found.
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    (import ../../modules/home-manager/git.nix { inherit inputs pkgs; })
    (import ../../modules/home-manager/neovim.nix { inherit inputs pkgs; })
    ../../modules/home-manager/bat.nix
    ../../modules/home-manager/bin.nix
    ../../modules/home-manager/direnv.nix
    ../../modules/home-manager/fzf.nix
    ../../modules/home-manager/htop.nix
    ../../modules/home-manager/lsd.nix
    ../../modules/home-manager/pet.nix
    ../../modules/home-manager/phpactor.nix
    ../../modules/home-manager/ripgrep.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/syncthing.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/zsh.nix
  ];
}
