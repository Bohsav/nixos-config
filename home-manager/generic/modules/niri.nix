{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri-flake.homeModules.stylix
  ];

  stylix.targets.niri.enable = false;

  programs.niri = {
    enable = true;
    settings = {
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 13.;
            top-right = 13.;
            bottom-left = 12.;
            bottom-right = 12.;
          };
          clip-to-geometry = true;
        }
      ];
      input.keyboard.xkb.layout = "us,ru";
      input.keyboard.track-layout = "global";
      layout = {
        gaps = 14;
        border.enable = false;
        focus-ring.enable = false;
      };
      binds = {
        "Mod+O".action.toggle-overview = { };

        "Ctrl+Space".action.switch-layout = "next";

        "Alt+A".action.focus-column-left = { };
        "Alt+S".action.focus-window-or-workspace-down = { };
        "Alt+W".action.focus-window-or-workspace-up = { };
        "Alt+D".action.focus-column-right = { };

        "Mod+Shift+H".action.show-hotkey-overlay = { };
        "Mod+Shift+E".action.quit.skip-confirmation = false;

        "Mod+Shift+Q".action.close-window = { };

        "Mod+Control+LeftArrow".action.move-column-left = { };
        "Mod+Control+RightArrow".action.move-column-right = { };

        "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = { };

        "Mod+M".action.maximize-column = { };
        "Mod+Shift+M".action.fullscreen-window = { };

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
