{pkgs, ...}: {
  programs.nnn = {
    enable = true;
    extraPackages = with pkgs; [
    ];
    plugins = {
      src = pkgs.fetchFromGithub {
        owner = "jarun";
        repo = "nnn";
      };
      mappings = {
        d = "diffs";
        p = "preview-tui";
      };
    };
  };
}
