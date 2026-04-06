{
  config,
  lib,
  pkgs,
  ...
}:
{

  programs.niri.enable = true;

  services.seatd.enable = true;

  # Hardware acceleration
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # dbus
  services.dbus.enable = true;

  # xdg portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
