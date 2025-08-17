{ pkgs, ... }:
{
  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override { withNerdIcons = true; };

    plugins = {
      src = ./zsh/nnn;
      mappings = {
        d = "diffs";
        p = "preview-tui";
      };
    };
  };
}
