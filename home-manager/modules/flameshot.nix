{pkgs, ...}: {
  flameshot.enable = true;
  flameshot.package = pkgs.flameshot.override {enableWlrSupport = true;};
}
