{
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "Fira Code Nerd Font";
      package = pkgs.nerd-fonts.fira-code;
      size = lib.mkDefault 12;
    };
    settings = {
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
      disable_ligatures = "cursor";
      hide_window_decorations = true;
      tab_bar_style = "powerline";
    };
  };
}
