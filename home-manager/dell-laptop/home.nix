{
  homeStateVersion,
  user,
  lib,
  ...
}:
{
  imports = [
    ../generic/home-packages.nix
    ./home-packages.nix
    ./modules.nix
  ];

  dconf.enable = lib.mkForce false;

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  fonts.fontconfig.enable = true;
}
