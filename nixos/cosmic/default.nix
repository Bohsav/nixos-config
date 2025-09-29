{ user, ... }:
{
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = user;
      };
      cosmic-greeter.enable = true;
    };
    desktopManager.cosmic.enable = true;
  };

  environment.cosmic.excludePackages = [ ];
}
