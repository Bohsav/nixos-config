{ lib, ... }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/lutris.nix
    ../generic/modules/nnn.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/dconf.nix
    ../generic/modules/kitty.nix

    ../generic/modules/zsh
    ../generic/modules/stylix
    ../generic/modules/nixvim
    ../generic/modules/easyeffects
  ];

  programs.kitty.font.size = 14;

  stylix = {
    cursor.size = 28;

    fonts.sizes = {
      terminal = 14;
      applications = 12;
    };
  };
}
