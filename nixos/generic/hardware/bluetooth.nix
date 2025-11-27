{ ... }:
{
  services.blueman.enable = false;
  hardware.bluetooth = {
    enable = true;

    powerOnBoot = true;

    settings.General.Experimental = true;
  };
}
