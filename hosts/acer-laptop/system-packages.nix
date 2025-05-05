{pkgs, ...}: {
  environment.systemPackages = let
    default-list = with pkgs; [home-manager vim git];
    get-gnome-extensions = import ./get-gnome-extensions.nix;
  in
    default-list ++ get-gnome-extensions {inherit pkgs;};
}
