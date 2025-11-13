{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Nixos";
        email = "bustion047@gmail.com";
      };
      init.defaultBranch = "main";

      pull.ff = "only";
    };
  };
}
