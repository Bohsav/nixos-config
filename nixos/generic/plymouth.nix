{ pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
      theme = "catppuccin-macchiato";
      themePackages = with pkgs; [ catppuccin-plymouth ];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };
}
