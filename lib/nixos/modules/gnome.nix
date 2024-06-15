{ pkgs, ... }:

{
  services.xserver = {
    desktopManager.gnome.enable = true;

    displayManager.sddm = {
      enable = true;
      # wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
