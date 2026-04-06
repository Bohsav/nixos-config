{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri-flake.homeManagerModules.default
  ];

  programs.niri = {
    enable = true;
    settings = {
      startup = {
        command = "noctalia-shell";
      };
    };
  };
}
