{ pkgs, ... }:
{
  environment.defaultPackages = with pkgs; [ nautilus ];
  programs.nautilus-open-any-terminal.enable = true;
  services.gnome.sushi.enable = true;
}
