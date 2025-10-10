{ ... }:
{
  services.xserver = {
    # Load nvidia driver for Xorg and Wayland
    videoDrivers = [ "nvidia" ];

    enable = true;
    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
