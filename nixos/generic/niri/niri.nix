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
    xdg-desktop-portal-gnome
  ];

  xdg.portal = {
    wlr.enable = true;
  };
}
