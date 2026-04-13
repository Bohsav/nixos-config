{ ... }:
{
  imports = [
    ../generic/modules/git.nix
    ../generic/modules/nnn.nix
    ../generic/modules/flameshot.nix
    ../generic/modules/kitty.nix
    ../generic/modules/lazygit.nix
    ../generic/modules/tmux.nix

    ../generic/modules/niri
    ../generic/modules/spicetify.nix
    ../generic/modules/zsh
    ../generic/modules/nixvim
    ../generic/modules/easyeffects

    ./stylix.nix
  ];

  programs.kitty.font.size = 14;

}
