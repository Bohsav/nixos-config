{ pkgs }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/lutris.nix
    ../generic/modules/nnn.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/zsh
    ../generic/modules/nixvim
    ../generic/modules/easyeffects

    ./stylix.nix
  ];

}
// import ../generic/modules/kitty.nix {
  pkgs = pkgs;
  font-size = 10;
}
