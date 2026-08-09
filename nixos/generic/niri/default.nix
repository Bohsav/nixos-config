{ ... }:
{
  services.upower.enable = true;
  imports = [
    ./niri.nix
    ./greetd.nix
    ./nautilus.nix
    ./xdg.nix
  ];
}
