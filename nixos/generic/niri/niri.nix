{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver.enable = lib.mkForce false;
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  systemd.user.services.niri.enableDefaultPath = false;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.waylock = { };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    swaylock
    swayidle
  ];

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gtk
  #     xdg-desktop-portal-gnome
  #     xdg-desktop-portal-wlr
  #   ];
  #
  #   config = {
  #     niri = {
  #       default = [
  #         "gtk"
  #         "gnome"
  #         "wlr"
  #       ];
  #       "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
  #       "org.freedekstop.impl.portal.Screenshot" = [ "wlr" ];
  #       "org.freedesktop.impl.portal.Access" = [ "gtk" ];
  #       "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
  #       "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
  #     };
  #   };
  # };
}
