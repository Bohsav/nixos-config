{
  pkgs,
  config,
  lib,
  ...
}:
{
  hardware.enableRedistributableFirmware = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  services.fstrim.enable = true;

  boot = {
    kernelModules = [
      "kvm-intel"
    ];
    blacklistedKernelModules = [
      "nouveau"
      "intel_hid"
    ];
  };
  boot.kernelParams = [
    "i915.modeset=1"
    "NVreg_UseKernelSuspendNotifiers=1"
  ];
  hardware = {
    graphics = {
      enable = lib.mkDefault true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-ocl
        intel-vaapi-driver
        vpl-gpu-rt
      ];
    };
    nvidia = {
      package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.stable;
      nvidiaSettings = lib.mkDefault true;
      modesetting.enable = lib.mkDefault true;
      open = lib.mkDefault false;
    };
  };

  # Override the intel gpu driver setting imported above
  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.graphics.enable (lib.mkOverride 990 "nvidia");
  };

  services.thermald.enable = lib.mkDefault true;

  # available cpufreq governors: performance powersave
  # The powersave mode locks the cpu to a 900mhz frequency which is not ideal
  # powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];

  # Disable LID0/lid
  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="platform" KERNEL=="PNP0C0D" ATTR{power/wakeup}="disabled"
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x8086" ATTR{device}=="0x7ae0" ATTR{power/wakeup}="disabled"
  '';
}
