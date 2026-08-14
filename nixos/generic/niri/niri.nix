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
  xdg.portal = lib.mkForce {
    enable = true;

    config.niri = {
      default = [
        "gnome"
        "gtk"
        "wlr"
      ];
      "org.freedesktop.impl.portal.Access" = "gtk";
      "org.freedesktop.impl.portal.Notification" = "gtk";
      "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
      "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      "org.freedesktop.impl.portal.Screenshot" = "wlr";
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  systemd.user.services.niri.enableDefaultPath = false;
  security.polkit.enable = true;
  security.pam.services.waylock = { };

  services.gnome.gnome-keyring.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    swaylock
    swayidle
  ];
}
