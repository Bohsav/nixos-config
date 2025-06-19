{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "Hack";
      package = pkgs.nerd-fonts.hack;
      size = 14;
    };
  };
}
