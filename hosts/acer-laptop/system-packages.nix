{pkgs, ...}: {
  environment.systemPackages = let
    default_list = with pkgs; [home-manager vim git];
    gnome_extensions = import ./gnome-extensions.nix;
  in
    default_list ++ gnome_extensions;
}
