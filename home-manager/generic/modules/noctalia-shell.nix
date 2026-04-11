{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      colorSchemes = {
        useWallpaperColors = true;
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
