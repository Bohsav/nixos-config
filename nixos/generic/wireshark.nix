{ pkgs, user, ... }: {
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users = {
    users.${user} = {
      isNormalUser = true;
      extraGroups = [
        "wireshark"
      ];
    };
  };
}
