{ lib, ... }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/nnn.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/kitty.nix
    ../generic/modules/dconf.nix
    ../generic/modules/lazygit.nix
    ../generic/modules/tmux.nix
    ../generic/modules/pass-secret-service.nix

    ../generic/modules/zsh
    ../generic/modules/nixvim
    ../generic/modules/easyeffects
    ../generic/modules/niri.nix

    ./stylix.nix
  ];

  programs.kitty.font.size = 12;

}
