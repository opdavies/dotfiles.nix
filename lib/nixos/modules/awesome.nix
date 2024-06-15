{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ nitrogen ];

  services.xserver.windowManager.awesome = {
    enable = true;
    noArgb = true;
  };
}
