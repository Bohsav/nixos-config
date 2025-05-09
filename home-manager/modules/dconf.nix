{pkgs, ...}: {
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        # x11-gestures.extensionUuid
        blur-my-shell.extensionUuid
        media-controls.extensionUuid
        open-bar.extensionUuid
        rounded-window-corners-reborn.extensionUuid
        transparent-window-moving.extensionUuid
        user-themes.extensionUuid
        system-monitor.extensionUuid
        windownavigator.extensionUuid
      ];
    };
    "org/gnome/shell/extensions/openbar" = {
      "autotheme-dark" = "Dark";
      "bartype" = "Trilands";
      "auto-bgalpha" = false;
      "autofg-bar" = true;
      "autohg-bar" = true;
      "autohg-menu" = true;
      "bgalpha" = 0;
      "bgalpha2" = 0;
      "bgalpha-wmax" = 1;
      "bg-change" = true;
      "border-wmax" = true;
      "bottom-margin" = 6.5;
      "boxalpha" = 0;
      "bradius" = 30;
      "bwidth" = 0.5;
      "fgalpha" = 1;
      "height" = 35;
      "hpad" = 2.5;
      "margin-wmax" = 2;
      "mfgalha" = 1;
      "neon" = true;
      "neon-wmax" = true;
      "shadow" = false;
      "trigger-autotheme" = false;
      "trigger-reload" = true;
      "vpad" = 3.5;
      "wmaxbar" = true;
    };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      "blur" = false;
    };
  };
}
