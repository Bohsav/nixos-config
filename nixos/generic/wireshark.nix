{ pkgs, user, ... }: {
  programs.wireshark = {
    enable = true;
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
