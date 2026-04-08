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
        "Alt+A".action.focus-column-left = { };
        "Alt+S".action.focus-window-or-workspace-down = { };
        "Alt+W".action.focus-window-or-workspace-up = { };
        "Alt+D".action.focus-column-right = { };

        "Mod+Shift+H".action.show-hotkey-overlay = { };
        "Mod+Shift+E".action.quit.skip-confirmation = false;

        "Mod+T" = {
          repeat = false;
          action.spawn = "kitty";
        };

        # Core Noctalia binds
        "Mod+Space".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];

        "Mod+Alt+L".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "lockScreen"
          "lock"
        ];

        # Audio & Brightness
        "XF86AudioRaiseVolume".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "increase"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "decrease"
        ];
        "XF86AudioMute".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "muteOutput"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "increase"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "decrease"
        ];
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
