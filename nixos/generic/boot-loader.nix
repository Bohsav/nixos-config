{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = false;

    efi.canTouchEfiVariables = true;
    grub =
      let
        theme-pkg = pkgs.catppuccin-grub.override { flavor = "frappe"; };
      in
      {
        enable = true;
        useOSProber = true;
        copyKernels = true;
        device = "nodev";
        efiSupport = true;

        fontSize = 16;
        theme = "${theme-pkg}";
        font = "${theme-pkg}/font.pf2";
      };
    timeout = 10;
  };
}
