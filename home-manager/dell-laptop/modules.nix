{ lib, ... }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/lutris.nix
    ../generic/modules/nnn.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/zsh
    ../generic/modules/nixvim
    ../generic/modules/easyeffects
    ../generic/modules/dconf.nix
    ../generic/modules/kitty.nix

    ./stylix.nix
  ];

  programs.kitty.font.size = 14;
}
