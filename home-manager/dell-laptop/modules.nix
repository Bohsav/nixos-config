{ pkgs }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/lutris.nix
    ../generic/modules/nnn.nix
    ../generic/modules/kitty.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/zsh
    ../generic/modules/nixvim
    ../generic/modules/easyeffects

    ./stylix.nix
  ];
}
