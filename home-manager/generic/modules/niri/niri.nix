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

        "Mod+A".action.focus-column-left = { };
        "Mod+S".action.focus-window-or-workspace-down = { };
        "Mod+W".action.focus-window-or-workspace-up = { };
        "Mod+D".action.focus-column-right = { };

        "Mod+Shift+H".action.show-hotkey-overlay = { };
        "Mod+Shift+E".action.quit.skip-confirmation = false;

        "Mod+Shift+Q".action.close-window = { };

        "Alt+Shift+A".action.move-column-left = { };
        "Alt+Shift+D".action.move-column-right = { };
        "Alt+Shift+W".action.move-column-to-workspace-up = { };
        "Alt+Shift+S".action.move-window-to-workspace-down = { };

        "Alt+Shift+N".action.switch-preset-column-width = { };
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
