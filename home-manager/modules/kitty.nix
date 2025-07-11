{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "Hack Nerd Font";
      package = pkgs.nerd-fonts.hack;
      size = 14;
    };
    # settings = {
    #   allow_remote_control = true;
    #   listen_on = "unix:/tmp/kitty";
    # };
  };
}
