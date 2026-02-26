{ pkgs, ... }:
{
  plugins.vimtex = {
    enable = false;

    texlivePackage = pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-tetex
        biblatex
        biber
        latexmk
        ;
    };

    # base example from nixvim wiki
    settings = {
      toc_config = {
        split_pos = "vert topleft";
        split_width = 40;
      };
      view_method = "zathura";
    };
  };

  plugins.cmp-vimtex = {
    enable = true;
  };

  plugins.cmp = {
    settings.sources = [
      { name = "vimtex"; }
    ];
  };

  plugins.treesitter.settings.highlight = {
    disable = [ "latex" ];
    additional_vim_regex_highlighting = [ "latex" ];
  };

  plugins.texpresso.enable = true;
}
