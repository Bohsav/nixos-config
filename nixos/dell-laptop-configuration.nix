{
  pkgs,
  stateVersion,
  hostname,
  ...
}:
{
  imports = [
    ../hosts/${hostname}/hardware-configuration.nix
    ./generic/default-system-packages.nix
    ./generic/boot-loader.nix
    ./generic/nix-settings.nix
    ./generic/networking.nix
    ./generic/programs.nix
    ./generic/users.nix

    # hardware
    ./generic/hardware/bluetooth.nix
    ./generic/hardware/laptop-A2000.nix

    # services
    ./generic/nix-services/xserver.nix
    ./generic/nix-services/printing.nix
    ./generic/nix-services/pipewire.nix
    ./generic/nix-services/tlp.nix
  ];

  services = {
    thermald.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kclock # Clock app
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.partitionmanager # Optional: Manage the disk devices, partitions and file systems on your computer
    kdePackages.ktorrent # Powerful BitTorrent client
    # Non-KDE graphical packages
    hardinfo2 # System information and benchmarks for Linux systems
    vlc # Cross-platform media player and streaming server
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
  ];

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa # Simple music player aiming to provide a nice experience for its users
    kdePackages.kdepim-runtime # Akonadi agents and resources
    kdePackages.kmahjongg # KMahjongg is a tile matching game for one or two players
    kdePackages.kmines # KMines is the classic Minesweeper game
    kdePackages.konversation # User-friendly and fully-featured IRC client
    kdePackages.kpat # KPatience offers a selection of solitaire card games
    kdePackages.ksudoku # KSudoku is a logic-based symbol placement puzzle
    mpv
  ];

  networking.hostName = hostname;

  time.timeZone = "America/Moncton";
  i18n.defaultLocale = "en_CA.UTF-8";

  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };

    logitech.wireless.enable = true;

    # Enable OpenGL
    graphics.enable = true;
  };

  programs.firefox = import ./generic/firefox/hard-settings.nix { inherit pkgs; };

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = stateVersion;
}
