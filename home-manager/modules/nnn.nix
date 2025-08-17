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
          rev = "v5.1";
          sha256 = "sha256-b0bb51180c3f2e33d6d65990734b5fd78e07a35c";
        })
        + "/plugins";
      mappings = {
        d = "diffs";
        p = "preview-tui";
      };
    };
  };
}
