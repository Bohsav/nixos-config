{ pkgs, ... }:
let
  texcount = pkgs.texlive.withPackages (ps: [ ps.texcount ]);
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Desktop apps
    solaar
    easyeffects
    discord
    libreoffice
    thunderbird
    vivaldi
    spotify
    logisim-evolution
    teams-for-linux

    # CLI tools
    xclip
    wl-clipboard
    devenv
    neofetch
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

    # tex packages
    zathura
    texcount

    openconnect
    openfortivpn-webview
  ];
}
