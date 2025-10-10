{
  pkgs,
  stateVersion,
  hostname,
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

    ./generic/hardware-nvidia-laptop-A2000.nix

    # services
    ./generic/nix-services/xserver.nix
    ./generic/nix-services/printing.nix
    ./generic/nix-services/pipewire.nix
    ./generic/nix-services/tlp.nix
  ];

  services = {
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
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;

    # Enable OpenGL
    graphics.enable = true;
  };

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = stateVersion;
}
