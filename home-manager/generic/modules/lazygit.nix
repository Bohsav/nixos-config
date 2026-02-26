{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      keybindings.universal.return = "<c-q>";
    };
  };
}
