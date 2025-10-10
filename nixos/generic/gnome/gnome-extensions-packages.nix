{ pkgs, ... }:
{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    media-controls
    open-bar
    rounded-window-corners-reborn
    transparent-window-moving
    system-monitor
    windownavigator
    applications-menu

    appindicator
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

}
