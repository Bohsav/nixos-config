{
  homeStateVersion,
  user,
  ...
}:
{
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  fonts.fontconfig.enable = true;
}
