{
  pkgs,
  inputs,
  ...
}:
{
  programs.niri = {
    enable = true;
    settings = {
      layout.border.enable = false;
      binds = {
        "Mod+A".action.focus-column-left = { };
        "Mod+S".action.focus-window-or-workspace-down = { };
        "Mod+W".action.focus-window-or-workspace-up = { };
        "Mod+D".action.focus-column-right = { };

        "Mod+Shift+E".action.quit.skip-confirmation = false;

        "Mod+T" = {
          repeat = false;
          action.spawn = "kitty";
        };
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
