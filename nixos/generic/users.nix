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

  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  documentation.dev.enable = true;
}
