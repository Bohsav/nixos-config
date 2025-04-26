{ homeStateVersion, user, ...}:

{
  imports = [ ./home-packages.nix ./modules ./nixvim ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;   
  };
}
