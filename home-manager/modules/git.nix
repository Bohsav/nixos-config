{
  programs.git = {
    enable = true;
    userName = "Nixos";
    userEmail = "bustion047@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
