{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_storm";
    font = {
      name = "MesloLGS NF";
      package = pkgs.meslo-lgs-nf;
      size = 13;
    };
  };
}
