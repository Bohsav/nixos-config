{ ... }:
{
  plugins.vimtex = {
    enable = true;

    # base example from nixvim wiki
    settings = {
      compiler_method = "latexrun";
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
