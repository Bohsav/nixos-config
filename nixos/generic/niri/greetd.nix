{
  pkgs,
  config,
  user,
  lib,
  ...
}:
let
  niriConfig = pkgs.writeText "greetd-niri-config" ''
    spawn-sh-at-startup "${config.services.displayManager.regreet.package}/bin/regreet; ${config.programs.niri.package}/bin/niri msg action quit --skip-confirmation"
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
        command = "${config.programs.niri.package}/bin/niri --session --config ${niriConfig}";
        user = "greeter";
      };
    };
  };

  services.displayManager.regreet = {
    enable = true;

    theme = {
      name = "Colloid";
      package = pkgs.colloid-gtk-theme;
    };

    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "DMZ-Black";
    };
  };
}
