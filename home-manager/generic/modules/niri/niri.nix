{
  pkgs,
  inputs,
  ...
}:
{
  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      environment."NIXOS_OZONE_WL" = "1";
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 12.;
            top-right = 12.;
            bottom-left = 12.;
            bottom-right = 12.;
          };
          clip-to-geometry = true;
        }
      ];
      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-overview*"; }
          ];

          place-within-backdrop = true;
        }
      ];
      outputs = {
        "HDMI-A-1".position = {
          x = 1920;
          y = 0;
        };
        "DP-2".position = {
          x = 0;
          y = 0;
        };
      };
      input.keyboard.xkb.layout = "us,ru";
      input.keyboard.track-layout = "global";
      layout = {
        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        gaps = 14;
        border.enable = false;
        focus-ring.width = 1;
      };
      binds = {
        "Mod+O".action.toggle-overview = { };

        "Ctrl+Space".action.switch-layout = "next";

        "Ctrl+Alt+A".action.focus-column-or-monitor-left = { };
        "Ctrl+Alt+S".action.focus-window-or-workspace-down = { };
        "Ctrl+Alt+W".action.focus-window-or-workspace-up = { };
        "Ctrl+Alt+D".action.focus-column-or-monitor-right = { };

        "Mod+Shift+H".action.show-hotkey-overlay = { };
        "Mod+Shift+E".action.quit.skip-confirmation = false;

        "Mod+N".action.focus-monitor-right = { };
        "Mod+Shift+N".action.focus-monitor-left = { };

        "Mod+Shift+Q".action.close-window = { };

        "Alt+Shift+A".action.move-column-left-or-to-monitor-left = { };
        "Alt+Shift+D".action.move-column-right-or-to-monitor-right = { };
        "Alt+Shift+W".action.move-column-to-workspace-up = { };
        "Alt+Shift+S".action.move-column-to-workspace-down = { };

        "Alt+Shift+C".action.switch-preset-column-width = { };
        "Mod+Ctrl+M".action.maximize-column = { };

        "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = { };

        "Mod+Shift+M".action.fullscreen-window = { };

        "Mod+T" = {
          repeat = false;
          action.spawn = "kitty";
        };

        "Print" = {
          repeat = false;
          action.spawn-sh = [ "flameshot gui -r | wl-copy" ];
        };

        # Core Noctalia binds
        "Mod+Space".action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];

        "Mod+Shift+L".action.spawn = [
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
