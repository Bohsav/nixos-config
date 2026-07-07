{
  plugins.copilot-cmp = {
    enable = false;
  };
  plugins.copilot-lua = {
    settings = {
      copilot = {
        suggestion = {
          enabled = false;
        };
        panel = {
          enabled = false;
        };
      };
    };
  };

  # extraConfigLua = ''
  #   require("copilot").setup({
  #     suggestion = { enabled = false },
  #     panel = { enabled = false },
  #   })
  # '';
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = true;
        };
        performance = {
          debounce = 60;
          fetching_timeout = 200;
          max_view_entries = 50;
        };
        snippet = {
          expand = "luasnip";
        };
        formatting = {
          fields = [
            "icon"
            "kind"
            "abbr"
            "menu"
          ];
        };
        sources = [
          {
            name = "nvim_lsp_signature_help";
            max_item_count = 3;
          }
          {
            name = "nvim_lsp"; # from neovim lsp
            max_item_count = 20;
          }
          {
            name = "jdtls"; # from jdtlsp
            max_item_count = 20;
          }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
            max_item_count = 5;
          }
          {
            name = "path"; # file system paths
            keywordLength = 3;
            max_item_count = 10;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
            max_item_count = 5;
          }
          {
            name = "treesitter"; # treesitter
            keywordLength = 3;
            max_item_count = 20;
          }
        ];

        window = {
          completion = {
            border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
          };
          documentation = {
            border = [
              "╭"
              "─"
              "╮"
              "│"
              "╯"
              "─"
              "╰"
              "│"
            ];
            max_height = "math.floor(40 * (40 / vim.o.lines))";
            max_width = "math.floor((40 * 2) * (vim.o.columns / (40 * 2 * 16 / 9)))";
          };
        };

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };
    cmp-nvim-lsp-signature-help = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    }; # lsp
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    }; # file system paths
    cmp_luasnip = {
      enable = true;
    }; # snippets
    cmp-treesitter = {
      enable = true;
    }; # treesitter info
  };
  extraConfigLua = ''

     local cmp = require'cmp'

     -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline({'/', "?" }, {
       sources = {
         { name = 'buffer' }
       }
     })

    -- Set configuration for specific filetype.
     cmp.setup.filetype('gitcommit', {
       sources = cmp.config.sources({
         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
       }, {
         { name = 'buffer' },
       })
     })

     -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
     cmp.setup.cmdline(':', {
       sources = cmp.config.sources({
         { name = 'path' }
       }, {
         { name = 'cmdline' }
       }),
     })  '';
}
