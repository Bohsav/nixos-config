{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    kitty
    solaar
    easyeffects
    dconf-editor
    discord
    libreoffice
    thunderbird
    vivaldi
    spotify
    gnome-tweaks
    logisim-evolution

    # Gaming
    # lutris
    steam

    # CLI tools
    nnn
    btop
    coreutils
    eza
    findutils
    nix-tree
    ncdu
    pciutils
    pfetch
    p7zip
    zip
    unrar
    tree
    ripgrep
    fzf
    unzip
    python3
    gcc
    wget
    oh-my-zsh
    zsh-powerlevel10k

    # Other
    hunspell
    hunspellDicts.en_CA
  ];
}
