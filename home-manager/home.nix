{
  homeStateVersion,
  user,
  config,
  lib,
  ...
}: {
  imports = [./home-packages.nix ./modules];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
    activation.copyDesktopFiles = lib.hm.dag.entryAfter ["installPackages"] ''
      if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ]; then

        if [ ! -d "${config.home.homeDirectory}/.local/share/applications" ]; then
          mkdir "${config.home.homeDirectory}/.local/share/applications"
        fi

        if [ -d "${config.home.homeDirectory}/.local/share/applications/nix" ]; then
          rm -rf "${config.home.homeDirectory}/.local/share/applications/nix"
        fi

        ln -sf "${config.home.homeDirectory}/.nix-profile/share/applications" \
          ${config.home.homeDirectory}/.local/share/applications/nix

      fi
    '';
  };
}
