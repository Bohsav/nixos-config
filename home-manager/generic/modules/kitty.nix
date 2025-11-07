{
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "Fira Code Nerd Font";
      package = pkgs.nerd-fonts.fira-code;
      size = 12;
    };
    settings = {
      allow_remote_control = true;
      listen_on = "unix:/tmp/kitty";
      disable_ligatures = "cursor";
    };
  };
}
