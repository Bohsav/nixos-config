{
  pkgs,
  stateVersion,
  hostname,
  ...
}:
{
  imports = [
    ../hosts/${hostname}/hardware-configuration.nix
    ./system-packages.nix
    ./exclude-gnome-apps.nix
    ./boot-loader.nix
    ./nix-settings.nix
    ./networking.nix
    ./programs.nix
    ./users.nix

    ./hardware-nvidia-laptop-A2000.nix

    # services
    ./nix-services/display.nix
    ./nix-services/xserver.nix
    ./nix-services/printing.nix
    ./nix-services/pipewire.nix
  ];

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
