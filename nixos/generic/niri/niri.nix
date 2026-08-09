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
  xdg.portal = {
    enable = false;
    config = lib.mkForce { };
    extraPortals = lib.mkForce [ ];
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
}
