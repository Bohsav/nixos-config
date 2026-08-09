{ pkgs, ... }: {
  wayland.windowManager.niri = {
    package = pkgs.niri;
    enable = true;

    extraConfig = ''
      window-rule {
        match app-id="dev.noctalia.Noctalia"

        open-floating true

        default-column-width { fixed 1080; }
        default-window-height { fixed 920; }
      }
    '';
    settings = {
      prefer-no-csd = { };
      environment = {
        "NIXOS_OZONE_WL" = "1";
      };
      _children = [
        {
          window-rule._children = [

            {
              geometry-corner-radius = 12;
              clip-to-geometry = true;
            }
          ];
        }

        {
          layer-rule._children = [
            {
              match._props = {
                namespace = "^noctalia-backdrop";
              };
            }
            {
              place-within-backdrop = true;
            }
          ];
        }

        {
          output = {
            _args = [ "HDMI-A-1" ];
            mode = "1920x1080@120.0";
            position._props = {
              x = 1920;
              y = 0;
            };
          };
        }
        {
          output = {
            _args = [ "DP-1" ];
            mode = "1920x1080@120.0";
            position._props = {
              x = 0;
              y = 0;
            };
          };
        }
      ];

      input = {
        keyboard = {
          xkb.layout = "us,ru";
          track-layout = "global";
        };
      };

      layout = {
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        gaps = 14;
        border.off = { };
        focus-ring.width = 1;
      };

      binds = {
        "Mod+O".toggle-overview = { };

        "Ctrl+Shift+L".switch-layout = "next";

        "Ctrl+Alt+A".focus-column-or-monitor-left = { };
        "Ctrl+Alt+S".focus-window-or-workspace-down = { };
        "Ctrl+Alt+W".focus-window-or-workspace-up = { };
        "Ctrl+Alt+D".focus-column-or-monitor-right = { };

        "Mod+Shift+H".show-hotkey-overlay = { };

        "Mod+Shift+E".quit._props = {
          skip-confirmation = false;
        };

        "Mod+N".focus-monitor-right = { };
        "Mod+Shift+N".focus-monitor-left = { };

        "Mod+Shift+Q".close-window = { };

        "Alt+Shift+A".move-column-left-or-to-monitor-left = { };
        "Alt+Shift+D".move-column-right-or-to-monitor-right = { };
        "Alt+Shift+W".move-column-to-workspace-up = { };
        "Alt+Shift+S".move-column-to-workspace-down = { };

        "Alt+Shift+C".switch-preset-column-width = { };
        "Mod+Ctrl+M".maximize-column = { };

        "Mod+Escape".toggle-keyboard-shortcuts-inhibit = { };

        "Mod+Shift+M".fullscreen-window = { };

        "Mod+T" = {
          _props = {
            repeat = false;
          };
          spawn = [ "kitty" ];
        };

        "Print" = {
          _props = {
            repeat = false;
          };
          spawn = [
            "noctalia"
            "msg"
            "screenshot-region"
          ];
        };

        # Core Noctalia binds
        "F4".spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+Space".spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+Shift+L".spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];
        "F3".spawn = [
          "noctalia"
          "msg"
          "settings-toggle"
        ];
        "F5".spawn = [
          "noctalia"
          "msg"
          "mic-mute"
        ];
        "F6".spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];

        "XF86AudioPrev".spawn = [
          "noctalia"
          "msg"
          "media"
          "previous"
        ];

        "XF86AudioPlay".spawn = [
          "noctalia"
          "msg"
          "media"
          "toggle"
        ];

        "XF86AudioNext".spawn = [
          "noctalia"
          "msg"
          "media"
          "next"
        ];

        # Audio & Brightness
        "XF86AudioRaiseVolume".spawn = [
          "noctalia"
          "msg"
          "volume-up"
        ];
        "XF86AudioLowerVolume".spawn = [
          "noctalia"
          "msg"
          "volume-down"
        ];
        "XF86AudioMute".spawn = [
          "noctalia"
          "msg"
          "volume-mute"
        ];
        "XF86MonBrightnessUp".spawn = [
          "noctalia"
          "msg"
          "brightness-up"
        ];
        "XF86MonBrightnessDown".spawn = [
          "noctalia"
          "msg"
          "brightness-down"
        ];
      };
      spawn-at-startup = "noctalia";
    };
  };

}
