{
  pkgs,
  inputs,
  ...
}:
{
  programs.niri = {
    enable = true;
    settings = {
binds = {
"Mod+Shift+E".action.quit.skip-confirmation = false;
"Mod+T".action.spawn = "kitty";
};
      spawn-at-startup = [
        {
          argv = [
            "noctalia-shell"
          ];
        }
      ];
    };
  };
}
