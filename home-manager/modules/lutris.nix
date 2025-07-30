{ pkgs, ... }:
{
  programs.lutris = {
    enable = true;

    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamescope
      gamemode
      umu-launcher
    ];

    protonPackages = [ pkgs.proton-ge-bin ];

    steamPackage = pkgs.steam;

    winePackages = [ pkgs.wineWowPackages.waylandFull ];
  };
}
