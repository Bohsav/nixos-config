{ pkgs, ... }:
{
  plugins.vimtex = {
    enable = true;

    texlivePackage = pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-tetex
        biblatex
        biber
        latexmk
        titlesec
        biblatex-ieee
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

  plugins.blink-cmp = {
    enable = true;
    settings.sources.providers = {
      latex-symbols = {
        score_offset = 100;
        module = "blink.compat.source";
        name = "vimtex";
        opts = {
          # set to true to insert the latex command instead of the symbol
          insert_command = false;
        };
      };
    };
    settings.sources.default = [
      "latex-symbols"
    ];
  };

  plugins.cmp-vimtex = {
    enable = true;
  };

  plugins.blink-compat = {
    enable = true;
  };

  # TODO: Addapt at some point
  # plugins.cmp = {
  #   settings.sources = [
  #     { name = "vimtex"; }
  #   ];
  # };

  plugins.treesitter.highlight.disable = [ "latex" ];
  plugins.treesitter.settings.highlight = {
    additional_vim_regex_highlighting = [ "latex" ];
  };

  plugins.texpresso.enable = true;
}
