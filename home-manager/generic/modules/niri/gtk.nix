{ pkgs, config, ... }:
{
  gtk = {
    enable = true;

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    gtk4.theme = null;
  };
}
