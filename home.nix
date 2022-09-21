{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "opdavies";
  home.homeDirectory = "/home/opdavies";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

    zplug = {
      enable = true;

      plugins = [
        { name = "mollifier/cd-gitroot"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };
}
