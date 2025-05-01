{
  nixpkgs.overlays = [
    # GNOME 47: triple-buffering-v4-47
    (final: prev: {
      mutter = prev.mutter.overrideAttrs (oldAttrs: {
        # GNOME dynamic triple buffering (huge performance improvement)
        # See https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441
        # Also https://gitlab.gnome.org/vanvugt/mutter/-/tree/triple-buffering-v4-47
        src = final.fetchFromGitLab {
          domain = "gitlab.gnome.org";
          owner = "GNOME";
          repo = "mutter";
          rev = "gnome-47";
          hash = "sha256-68f5337c57a7421ebcc4b7e72141ec896c33d9f7";
        };

        # GNOME 47 requires the gvdb subproject which is not included in the triple-buffering branch
        # This copies the necessary gvdb files from the official GNOME repository
        preConfigure = let
          gvdb = final.fetchFromGitLab {
            domain = "gitlab.gnome.org";
            owner = "GNOME";
            repo = "gvdb";
            rev = "main";
            hash = "sha256-4758f6fb7f889e074e13df3f914328f3eecb1fd3";
          };
        in ''
          cp -a "${gvdb}" ./subprojects/gvdb
        '';
      });
    })
  ];
}
