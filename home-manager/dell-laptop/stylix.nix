{ pkgs, ... }:
{
  home.packages = with pkgs; [
    times-newer-roman
    dejavu_fonts
    noto-fonts
    noto-fonts-lgc-plus
    texlivePackages.hebrew-fonts
    font-awesome
    powerline-fonts
    powerline-symbols
    meslo-lgs-nf
    nerd-fonts.symbols-only
  ];

  stylix = {
    # NOTE temporarily resolve the issue.
    enableReleaseChecks = false;
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    targets = {
      gnome.enable = true;
      kitty.enable = false;
      nvf.enable = false;
      nixvim.enable = false;
      niri.enable = false;
      noctalia-shell.enable = false;
      noctalia.enable = false;
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
        name = "Fira Code Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      sansSerif = {
        name = "Raleway-Regular";
        package = pkgs.raleway;
      };
      serif = {
        name = "Raleway-Regular";
        package = pkgs.raleway;
      };
      sizes = {
        terminal = 14;
        applications = 13;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    image = ../generic/modules/stylix/assets/mountain.jpeg;
  };
}
