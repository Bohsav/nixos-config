{ ... }:
{
  services = {
    power-profiles-daemon.enable = false;
    tlp = {
      pd.enable = true;
      enable = true;
      settings = {
        TLP_PROFILE_AC = "PRF";
        TLP_PROFILE_BAT = "SAV";

        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        PLATFORM_PROFILE_ON_SAV = "quiet";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        # Optional helps save long term battery health
        START_CHARGE_THRESH_BAT0 = 60; # and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 95; # and above it stops charging

      };
    };
  };
}
