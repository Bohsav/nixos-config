{ ... }:
{
  virtualisation.docker = {
    enable = false;
    autoPrune = {
      enable = true;
      dates = "monthly";
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
