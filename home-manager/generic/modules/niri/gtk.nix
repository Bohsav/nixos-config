{ pkgs, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
