{
  config,
  pkgs,
  user,
  stateVersion,
  hostname,
  ...
}:
{
  imports = [
    ../hosts/${hostname}/hardware-configuration.nix
    ./system-packages.nix
    ./exclude-gnome-apps.nix
  ];

  networking.hostName = hostname;

  # boot loader
  boot.loader = {
    systemd-boot.enable = false;

    efi.canTouchEfiVariables = true;
    grub =
      let
        theme-pkg = pkgs.catppuccin-grub.override { flavor = "frappe"; };
      in
      {
        enable = true;
        useOSProber = true;
        copyKernels = true;
        device = "nodev";
        efiSupport = true;

        fontSize = 16;
        theme = "${theme-pkg}";
        font = "${theme-pkg}/font.pf2";
      };
    timeout = 10;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-users = [
      "root"
      "sleepyfox"
    ];
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };

  # Set your time zone.
  time.timeZone = "America/Moncton";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  # Set GNOME environment
  services = {
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };

    xserver = {
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = [ "nvidia" ];

      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      wireplumber = {
        enable = true;
        configPackages = [
          (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/51-mitigate-annoying-profile-switch.conf" ''
            wireplumber.settings = {
              bluetooth.autoswitch-to-headset-profile = false
            }

            monitor.bluez.properties = {
              bluez5.roles = [ a2dp_sink a2dp_source ]
            }
          '')
        ];
      };

      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    blueman.enable = true;
    pulseaudio.enable = false;
  };

  # Enable sound with pipewire.
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };

    logitech.wireless.enable = true;
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    # Enable OpenGL
    graphics.enable = true;

    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      open = true; # For A2000

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        # offload = {
        #   enable = true;
        #   enableOffloadCmd = true;
        # };
        # Remove the "offload" above and uncomment the line below
        sync.enable = true;
      };
    };
  };
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs = {
    zsh.enable = true;
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    firefox = import ./firefox-settings.nix { inherit pkgs; };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "scanner"
        "lp"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = stateVersion;
}
