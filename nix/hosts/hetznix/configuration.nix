{
  modulesPath,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")

    ./disks.nix
    ./hardware-configuration.nix

    ./modules/acme.nix
    ./modules/nginx
  ];

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
    pkgs.tree
    pkgs.vim
    pkgs.wget
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkkbYaCD9NUIQT0NnsmlyfepwjxBYeiJSBCotOpdPTyc5inFAd29DiVw98j4skfaHdzjcqWmMFmDQWM6tGkK7eg8n0WuaABmsjdEbzTtfjHwM0tRDCIh5AtoT4IvoLhwLjEI2jKM05BGCQ2m5lS//AYJK1DjiV4UH+IjXHz6oy/3eFzQwANjxWS+mbR565p21yuAu1DKEyaGeVzT1xDhgzlnZG7Cys/rFgUYpIvYDHMOFxG6hsDB8vqyHiTXniniti5tdvGGYHgRGQcynRTU12aerrqHTIOefrElXJdf3/PA8FIY/Pd3MmZocY/vvQe0EVHXWrNtnHOF3MFQ1tFyfubKO51Dcp9KmzHnyBvO4CtvGVr/upSVWfo0I/EqkIqvCvBbdSIPeH9V5hAcyWENGF4Wf0/Yqtc0dBhfXJmPVBsC2ghZp9oERK+h5Xs7DpzkT0vtkN+wjgA5weIuG8e2UVNO29LWASzlychVqb7BVa6kNn5CyGwauyIGsYvAFnUjkyJpK8qleNM3VO5x9aw26IhSKlnSE9PAdX8p7PpdoWfxWRekKTc4h6iAe7pFOENvuokAvCNsE5LolR4VrYKXjA0m3nupDNWYexAWfR3lSeSlKd9nD3OENS0biJKayZHs11iDUTxm5u5gm/U60b4z0zDXjh1H/DI/pSCG6jjaXDpw== opdavies@lemp11"
  ];

  system.stateVersion = "24.05";
}
