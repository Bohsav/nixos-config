{ pkgs, ... }:
let
  niriConfig = pkgs.writeText "greetd-niri-config" ''
    spawn-sh-at-startup "regreet; niri msg action quit --skip-confirmation"
    hotkey-overlay {
        skip-at-startup
    }
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "niri --config ${niriConfig}";
        user = "greeter";
      };
    };
  };
  programs.regreet = {
    enable = true;
  };
}
