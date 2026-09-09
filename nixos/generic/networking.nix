{ pkgs, ... }:
{
  networking.dhcpcd.enable = true;

  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
  };
}
