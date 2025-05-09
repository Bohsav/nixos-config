{pkgs, ...}: {
  environment.systemPackages = let
    default-list = with pkgs; [home-manager vim git];
    gnome-extensions = import ./get-gnome-extensions.nix {inherit pkgs;};
  in
    default-list ++ gnome-extensions;
}
