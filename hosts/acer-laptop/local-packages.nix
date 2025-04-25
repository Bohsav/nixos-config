{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    git
  ];
}
