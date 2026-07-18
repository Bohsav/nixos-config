{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    wlr.enable = true;

    config = {
      niri = {
        default = [
          "gtk"
          "gnome"
          "wlr"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedekstop.impl.portal.Screenshot" = [ "wlr" ];
        "org.freedesktop.impl.portal.Access" = [ "gtk" ];
        "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };
}
