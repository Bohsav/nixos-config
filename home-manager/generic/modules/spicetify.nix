{ inputs, pkgs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        fullAppDisplay
      ];

      wayland = true;

      theme = spicePkgs.themes.starryNight;
    };
}
