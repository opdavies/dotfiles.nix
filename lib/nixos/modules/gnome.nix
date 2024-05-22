{ pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;

    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
