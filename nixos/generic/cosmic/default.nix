{ user, pkgs, ... }:
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
  environment.systemPackages = with pkgs; [ forecast ];

  environment.cosmic.excludePackages = [ ];
}
