{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-power-manager
    dia
    eog
  ];
}
