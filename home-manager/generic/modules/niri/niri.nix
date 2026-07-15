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
      debug = {
        honor-xdg-activation-with-invalid-serial = [ ];
      };
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 20.;
            top-right = 20.;
            bottom-left = 20.;
            bottom-right = 20.;
          };
          clip-to-geometry = true;
        }
        {
          matches = [ { app-id = "dev.noctalia.Noctalia.Settings"; } ];
          open-floating = true;
          default-column-width.fixed = 1080;
          default-window-height.fixed = 920;
        }
      ];
      layer-rules = [
        {
          matches = [
            { namespace = "^noctalia-backdrop"; }
          ];

          place-within-backdrop = true;
        }
      ];
      outputs = {
        "HDMI-A-1" = {
          mode = {
            refresh = 120.0;
            width = 1920;
            height = 1080;
          };
          position = {
            x = 0;
            y = 0;
          };
        };
        "DP-1" = {
          mode = {
            refresh = 120.0;
            width = 1920;
            height = 1080;
          };
          position = {
            x = 1920;
            y = 0;
          };
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

        "Ctrl+Shift+L".action.switch-layout = "next";

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
        "F4".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+Space".action.spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+Shift+L".action.spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];
        "F3".action.spawn = [
          "noctalia"
          "msg"
          "settings-toggle"
        ];
        "F5".action.spawn = [
          "noctalia"
          "msg"
          "mic-mute"
        ];
        "F6".action.spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];

        "XF86AudioPrev".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "previous"
        ];

        "XF86AudioPlay".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "toggle"
        ];

        "XF86AudioNext".action.spawn = [
          "noctalia"
          "msg"
          "media"
          "next"
        ];

        # Audio & Brightness
        "XF86AudioRaiseVolume".action.spawn = [
          "noctalia"
          "msg"
          "volume-up"
        ];
        "XF86AudioLowerVolume".action.spawn = [
          "noctalia"
          "msg"
          "volume-down"
        ];
        "XF86AudioMute".action.spawn = [
          "noctalia"
          "msg"
          "volume-mute"
        ];
        "XF86MonBrightnessUp".action.spawn = [
          "noctalia"
          "msg"
          "brightness-up"
        ];
        "XF86MonBrightnessDown".action.spawn = [
          "noctalia"
          "msg"
          "brightness-down"
        ];
      };
      spawn-at-startup = [
        {
          argv = [
            "noctalia"
          ];
        }
      ];
    };
  };
}
