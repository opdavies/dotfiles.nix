{
  config,
  hostname,
  inputs,
  lib,
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

  features = lib.mkMerge [
    {
      cli = {
        neovim.enable = lib.mkDefault true;
        tmux.enable = lib.mkDefault true;
      };

      desktop = {
        alacritty.enable = lib.mkDefault true;
      };
    }
  ];

  imports = [
    (import ../../modules/home-manager {
      inherit
        config
        inputs
        lib
        self
        pkgs
        ;
    })

    ../../home/${username}/hosts/${hostname}.nix
  ];
}
