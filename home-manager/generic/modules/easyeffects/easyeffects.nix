{
  services.easyeffects = {
    enable = true;

    extraPresets = {
      base = builtins.fromJSON (builtins.readFile ./Base.json);
      base-reverb = builtins.fromJSON (builtins.readFile ./Base+Reverb.json);
    };
  };
}
