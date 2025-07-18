{pkgs, ...}: {
  programs.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {enableWlrSupport = true;};
  };
}
