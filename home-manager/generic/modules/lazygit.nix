{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      keybinding.universal.return = "<c-q>";
    };
  };
}
