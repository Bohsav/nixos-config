{pkgs, ...}: {
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        x11-gestures.extensionUuid
        blur-my-shell.extensionUuid
        media-controls.extensionUuid
        open-bar.extensionUuid
        rounded-window-corners-reborn.extensionUuid
        transparent-window-moving.extensionUuid
      ];
    };

    # "org/gnome/shell/extensions/blur-my-shell" = {
    # };
  };
}
