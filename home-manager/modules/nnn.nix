{pkgs, ...}: {
  programs.nnn = {
    enable = true;
    extraPackages = with pkgs; [
      dragon-drop
    ];
    plugins.mappings = {
      d = "diffs";
      g = "dragdrop";
      p = "preview-tui";
    };
  };
}
