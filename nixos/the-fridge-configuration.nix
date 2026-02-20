{
  pkgs,
  stateVersion,
  hostname,
  user,
  ...
}:
{
  imports = [
    # desktop
    ./generic/gnome

    ../hosts/${hostname}/hardware-configuration.nix
    ./generic/default-system-packages.nix
    ./generic/boot-loader.nix
    ./generic/nix-settings.nix
    ./generic/networking.nix
    ./generic/programs.nix
    ./generic/users.nix

    # hardware
    ./generic/hardware/bluetooth.nix
    ./generic/hardware/nvidia-3060.nix

    # services
    ./generic/nix-services/xserver.nix
    ./generic/nix-services/printing.nix
    ./generic/nix-services/pipewire.nix
  ];

  boot.kernelParams = [
    "nouveau.modeset=0"
  ];
  powerManagement.enable = true;
  boot.resumeDevice = "/dev/disk/by-uuid/464b27a4-5169-424c-869f-09af869d043d";

  networking.hostName = hostname;

  time.timeZone = "America/Moncton";
  i18n.defaultLocale = "en_CA.UTF-8";

  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };

    logitech.wireless.enable = true;

    # Enable OpenGL
    graphics.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  users.users.${user}.extraGroups = [ "docker" ];

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    firefox = import ./generic/firefox/soft-settings.nix { inherit pkgs; };
  };

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = stateVersion;
}
