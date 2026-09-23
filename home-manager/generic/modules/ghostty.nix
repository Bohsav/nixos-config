{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      theme = "Catppuccin Macchiato";
    };
  };
}
