{ pkgs, ... }:
{
  home.packages = with pkgs; [
    times-newer-roman
    dejavu_fonts
    noto-fonts
    noto-fonts-lgc-plus
    texlivePackages.hebrew-fonts
    noto-fonts-color-emoji
    font-awesome
    powerline-fonts
    powerline-symbols
    meslo-lgs-nf
    nerd-fonts.symbols-only
  ];

  stylix = {
    enableReleaseChecks = false;
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    targets = {
      kitty.enable = false;
      gnome.enable = true;
      nvf.enable = false;
      nixvim.enable = false;
      niri.enable = false;
      noctalia-shell.enable = false;
      spicetify.enable = false;
    };

    cursor = {
      name = "DMZ-Black";
      size = 28;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "MesloLGS NF";
        package = pkgs.meslo-lgs-nf;
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        terminal = 14;
        applications = 11;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = ../generic/modules/stylix/assets/water.jpeg;
  };
}
