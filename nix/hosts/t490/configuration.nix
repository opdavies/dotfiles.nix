{
  hostname,
  inputs,
  outputs,
  pkgs,
  desktop ? false,
  self,
  system,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit
        hostname
        inputs
        outputs
        desktop
        self
        system
        username
        ;
    };
    useGlobalPkgs = true;
    useUserPackages = true;

    users."${username}" = import "${self}/nix/home/${username}";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;

      permittedInsecurePackages = [ "electron-27.3.11" ];
    };

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.xserver = {
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "Oliver Davies";
    extraGroups = [
      "docker"
      "media"
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };

  users.groups.media = { };

  security.sudo.wheelNeedsPassword = false;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with pkgs;
    [
      caffeine-ng
      cryptsetup
      gtypist
      fastfetch
      mermaid-cli
      mkcert
      ttyper
      yt-dlp
      ytfzf
    ]
    ++ pkgs.lib.optionals desktop [
      acpi
      arandr
      brightnessctl
      cpufrequtils
      libnotify
      pmutils
      ffmpegthumbnailer
      libreoffice
      logseq
      rclone
      rclone-browser
      shotwell
      vscode
      xfce.thunar
      xfce.thunar-volman
      xfce.tumbler
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    9003 # xdebug
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

  programs.dconf.enable = true;

  programs.zsh.enable = true;
  programs.zsh.histSize = 5000;

  users.defaultUserShell = "/etc/profiles/per-user/${username}/bin/zsh";

  zramSwap.enable = true;

  nix = {
    extraOptions = ''
      trusted-users = root ${username}
    '';

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  # Make Caps lock work as an Escape key on press and Ctrl on hold.
  services.interception-tools =
    let
      dfkConfig = pkgs.writeText "dual-function-keys.yaml" ''
        MAPPINGS:
          - KEY: KEY_CAPSLOCK
            TAP: KEY_ESC
            HOLD: KEY_LEFTCTRL
      '';
    in
    {
      enable = true;
      plugins = pkgs.lib.mkForce [ pkgs.interception-tools-plugins.dual-function-keys ];
      udevmonConfig = ''
        - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.dual-function-keys}/bin/dual-function-keys -c ${dfkConfig} | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
          DEVICE:
            NAME: "AT Translated Set 2 keyboard"
            EVENTS:
              EV_KEY: [[KEY_CAPSLOCK, KEY_ESC, KEY_LEFTCTRL]]
      '';
    };

  services.gvfs.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
    preferences = {
      "intl.accept_languages" = "en-GB, en";
      "intl.regional_prefs.use_os_locales" = true;
    };
  };

  services.blueman.enable = true;

  services.cron = {
    enable = true;

    systemCronJobs = [ "* * * * * opdavies /home/${username}/.local/bin/notify-battery" ];
  };

  services.auto-cpufreq.enable = true;

  services.udev = {
    enable = true;
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
