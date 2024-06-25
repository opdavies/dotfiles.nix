{ pkgs, ... }:

{
  services = {
    displayManager.sddm.enable = true;

    xserver.desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
