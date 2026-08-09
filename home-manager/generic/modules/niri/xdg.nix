{ pkgs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    configPackages = lib.mkForce [ ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
    ];

    config = lib.mkForce {
      niri = {
        default = [
          "gtk"
          "gnome"
          "wlr"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedekstop.impl.portal.Screenshot" = "wlr";
        "org.freedesktop.impl.portal.Access" = "gtk";
        "org.freedesktop.impl.portal.Notification" = "gtk";
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };
}
