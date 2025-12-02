{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    dconf-editor
    gnome-power-manager
    dia
    eog
  ];
}
