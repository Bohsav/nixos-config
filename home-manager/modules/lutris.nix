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

    runners = {
      cemu.package = pkgs.cemu;
      pcsx2.config = {
        system.disable_screen_saver = true;
        runner.runner_executable = "$\{pkgs.pcsx2}/bin/pcsx2-qt";
      };
    };

    steamPackage = pkgs.steam;

    winePackages = pkgs.wineWow64Packages.wayland;
  };
}
