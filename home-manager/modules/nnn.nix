{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };

    plugins = {
      src =
        (pkgs.fetchFromGitHub {
          owner = "jarun";
          repo = "nnn";
          rev = "5.1";
        })
        + "/plugins";
      mappings = {
        d = "diffs";
        p = "preview-tui";
      };
    };
  };
}
