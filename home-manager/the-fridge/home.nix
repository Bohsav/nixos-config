{
  homeStateVersion,
  user,
  lib,
  ...
}:
{
  dconf.enable = lib.mkForce false;
  imports = [
    ./home-packages.nix
    ../generic/home-packages.nix
    ./modules.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  fonts.fontconfig.enable = true;
}
