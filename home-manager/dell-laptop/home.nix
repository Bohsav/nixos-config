{
  homeStateVersion,
  user,
  ...
}:
{
  imports = [
    ../generic/home-packages.nix
    ./home-packages.nix
    ./modules.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  fonts.fontconfig.enable = true;
}
