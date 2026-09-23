{ pkgs, user, ... }:
{
  users = {
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "scanner"
        "lp"
      ];
    };
  };
}
