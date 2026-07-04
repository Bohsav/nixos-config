{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    dejavu_fonts
  ];

  services.swayidle = {
    enable = true;

    events.before-sleep = "${config.programs.noctalia.package}/bin/noctalia ipc call lockScreen lock";

    extraArgs = [ "-w" ];
  };

  programs.noctalia = {
    enable = true;
    settings = {
      shell.niri_overview_type_to_launch_enabled = true;
      backdrop.enabled = true;

      colorSchemes = {
        useWallpaperColors = true;
      };

      nightlight.enabled = true;

      bar.main = {
        widget_spacing = 8;
        background_opacity = 0.8;

        margin_ends = 18;
        start = [
          "wallpaper"
          "workspaces"
          "launcher"
          "tray"
          "active_window"
        ];
        center = [
          "privacy"
          "lock_keys"
          "audio_visualizer"
          "media"
          "weather"
          "notifications"
        ];
        end = [
          "control-center"
          "session"
          "keyboard_layout"
          "bluetooth"
          "network"
          "sysmon"
          "battery"
          "volume"
          "brightness"
        ];
      };

      widget."lock_keys" = {
        display = "full";
        hide_when_off = true;
      };

      widget."privacy" = {
        hide_inactive = true;
      };

      widget."audio_visualizer" = {
        show_when_idle = true;
      };

      widget."notifications" = {
        hide_when_no_unread = true;
      };
    };
  };
}
