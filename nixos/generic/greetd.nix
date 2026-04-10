{
  pkgs,
  config,
  user,
  lib,
  ...
}:
let
  niriConfig = pkgs.writeText "greetd-niri-config" ''
    spawn-sh-at-startup "${config.programs.regreet.package}/bin/regreet; ${config.programs.niri.package}/bin/niri msg action quit --skip-confirmation"
    hotkey-overlay {
        skip-at-startup
    }
    cursor {
        xcursor-theme "Adwaita"
    }
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri --config ${niriConfig}";
        user = "greeter";
      };
    };
  };

  programs.regreet = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "DMZ-Black";
    };
  };
}
