{ ... }:
{
  programs.dconf.enable = true;
  imports = [
    ./display.nix
    ./gnome-extensions-packages.nix
    ./exclude-gnome-apps.nix
    ./gnome-relevant-pckgs.nix
  ];
}
