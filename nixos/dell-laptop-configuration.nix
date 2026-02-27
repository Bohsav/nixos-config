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
    ./generic/hardware/laptop-A2000.nix

    # services
    ./generic/nix-services/xserver.nix
    ./generic/nix-services/printing.nix
    ./generic/nix-services/pipewire.nix
    ./generic/nix-services/tlp.nix
  ];

  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "monthly";
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  powerManagement.enable = true;
  boot.resumeDevice = "/dev/disk/by-uuid/304d22bd-c8c1-47b2-991c-bc524d0ba05f";

  services = {
    fwupd.enable = true;
    thermald.enable = true;
  };

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

  programs.firefox = import ./generic/firefox/hard-settings.nix { inherit pkgs; };
  security.rtkit.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = stateVersion;
}
