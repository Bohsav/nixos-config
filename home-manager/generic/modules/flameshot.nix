{ pkgs, ... }:
{
  home.packages = with pkgs; [ grim ];
  services.flameshot = {
    enable = true;
  };
}
