{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
    firefox = import ./firefox-settings.nix { inherit pkgs; };
  };
}
