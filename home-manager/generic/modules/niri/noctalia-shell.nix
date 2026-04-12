{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    dejavu_fonts
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      colorSchemes = {
        useWallpaperColors = true;
      };

      ui = {
        fontDefault = "DejaVu Sans";
        fontFixed = "DejaVu Sans Mono";
      };

      # plugins = {
      #   sources = [
      #     {
      #       enabled = true;
      #       name = "Official Noctalia Plugins";
      #       url = "https://github.com/noctalia-dev/noctalia-plugins";
      #     }
      #   ];
      #   states = {
      #     mangowc-layout-switcher = {
      #       enabled = true;
      #       sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
      #     };
      #   };
      # };
      # pluginSettings = { };

      nightLight.enabled = true;

      wallpaper = {
        overviewEnabled = true;
      };

      bar = {
        widgets = {
          left = [
            {
              id = "Launcher";
            }
            {
              id = "Workspace";
            }
            {
              id = "SystemMonitor";
            }
          ];
          center = [
            {
              id = "MediaMini";
            }
            {
              id = "Clock";
            }
            {
              id = "ActiveWindow";
            }
          ];
        };
      };
    };
  };
}
