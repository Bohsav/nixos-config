{pkgs, ...}: {
  programs.nnn = {
    enable = true;
    extraPackages = with pkgs; [
    ];
    plugins = {
      src =
        (pkgs.fetchFromGithub {
          owner = "jarun";
          repo = "nnn";
        })
        + "/plugins";
      mappings = {
        d = "diffs";
        p = "preview-tui";
      };
    };
  };
}
