{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [
    nautilus
    sushi
  ];
  programs.nautilus-open-any-terminal.enable = true;
  services.gnome.sushi.enable = true;
  programs.niri.useNautilus = true;
}
