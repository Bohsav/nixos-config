{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    # Desktop apps
    kitty
    
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
  ];
}
